//
//  AlamofireHandyJSON.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON

extension DataRequest {
    
    enum ErrorCode: Int {
        case noData = 1
        case dataSerializationFailed = 2
    }
    
    internal static func newError(_ code: ErrorCode, failureReason: String) -> NSError {
        let errorDomain = "com.alamofireobjectmapper.error"
        
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        let returnError = NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo)
        
        return returnError
    }
    
    internal static func log(_ response: HTTPURLResponse?, _ result: Result<Any>) {
        debugPrint("==========================================================================")
        if let _response = response { debugPrint(_response) }
        debugPrint("--------------------------------------------------------------------------")
        if let _v = result.value { debugPrint(_v) }
        debugPrint("==========================================================================")
    }
    
    public static func HandyMapperSerializer<T: HandyJSON>(_ keyPath: String?) -> DataResponseSerializer<T> {
        return DataResponseSerializer { request, response, data, error in
            guard error == nil else {
                return .failure(error!)
            }
            
            guard let _ = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = newError(.noData, failureReason: failureReason)
                return .failure(error)
            }
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
            log(response, result)
            
            let JSONToMap: Any?
            if let keyPath = keyPath , keyPath.isEmpty == false {
                JSONToMap = (result.value as AnyObject?)?.value(forKeyPath: keyPath)
            } else {
                JSONToMap = result.value
            }
            
            if let jsonToMap = JSONToMap as? NSDictionary {
                if let parsedObject = JSONDeserializer<T>.deserializeFrom(dict: jsonToMap) {
                    return .success(parsedObject)
                }
            }
            
            let failureReason = "HandyJSON failed to serialize response."
            let error = newError(.dataSerializationFailed, failureReason: failureReason)
            return .failure(error)
        }
    }
    
    /**
     Adds a handler to be called once the request has finished.
     
     - parameter queue:             The queue on which the completion handler is dispatched.
     - parameter keyPath:           The key path where object mapping should be performed
     - parameter completionHandler: A closure to be executed once the request has finished and the data has been mapped by HandyJSON.
     
     - returns: The request.
     */
    @discardableResult
    public func responseHandy<T: HandyJSON>(queue: DispatchQueue? = nil, keyPath: String? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.HandyMapperSerializer(keyPath), completionHandler: completionHandler)
    }
    
    
    public static func HandyMapperArraySerializer<T: HandyJSON>(_ keyPath: String?) -> DataResponseSerializer<[T]> {
        return DataResponseSerializer { request, response, data, error in
            guard error == nil else {
                return .failure(error!)
            }
            
            guard let _ = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = newError(.dataSerializationFailed, failureReason: failureReason)
                return .failure(error)
            }
            
//            let stringResponseSerializer = DataRequest.stringResponseSerializer()
//            let result = stringResponseSerializer.serializeResponse(request, response, data, error)
//            log(response, result)
//            
//            if let parsedObject = JSONDeserializer<T>.deserializeModelArrayFrom(json: result.value) {
//                return .success(parsedObject.flatMap { $0 })
//            }
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
            log(response, result)
            
            let jsonObject: Any?
            if let keyPath = keyPath , keyPath.isEmpty == false {
                jsonObject = (result.value as AnyObject?)?.value(forKeyPath: keyPath)
            } else {
                jsonObject = result.value
            }
            
            if let jsonArray = jsonObject as? NSArray {
                let parsedObject = jsonArray.map({ (jsonDict) -> T? in
                    JSONDeserializer<T>.deserializeFrom(dict: jsonDict as? NSDictionary)
                }).flatMap { $0 }
                return .success(parsedObject)
            }
            
            let failureReason = "ObjectMapper failed to serialize response."
            let error = newError(.dataSerializationFailed, failureReason: failureReason)
            return .failure(error)
        }
    }
}
