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
            
            let failureReason = "ObjectMapper failed to serialize response."
            let error = newError(.dataSerializationFailed, failureReason: failureReason)
            return .failure(error)
        }
    }
    
    /**
     Adds a handler to be called once the request has finished.
     
     - parameter queue:             The queue on which the completion handler is dispatched.
     - parameter keyPath:           The key path where object mapping should be performed
     - parameter object:            An object to perform the mapping on to
     - parameter completionHandler: A closure to be executed once the request has finished and the data has been mapped by ObjectMapper.
     
     - returns: The request.
     */
    @discardableResult
    public func responseHandy<T: HandyJSON>(queue: DispatchQueue? = nil, keyPath: String? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.HandyMapperSerializer(keyPath), completionHandler: completionHandler)
    }
}
