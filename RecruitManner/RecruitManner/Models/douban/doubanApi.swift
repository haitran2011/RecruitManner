//
//  File.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class DoubanApi {
    
    enum Router: URLRequestConvertible {
        
        case readMovie(start: Int, count: Int)
        
        static let baseURLString = "https://api.douban.com/v2/movie"
        
        var method: HTTPMethod {
            switch self {
            case .readMovie:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .readMovie:
                return "/top250"
            }
        }
        
        var parameters: Parameters {
            switch self {
            case .readMovie(let start, let count):
                return ["start" : start, "count" : count]
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try Router.baseURLString.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            switch self {
            case .readMovie:
                 urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            }
            
            debugPrint(urlRequest)
            return urlRequest
        }
    }
    
    private var sessionManager: SessionManager
    
    private static let sharedInstance = DoubanApi()
    class public var shared: DoubanApi {
        return sharedInstance
    }
    
    init() {
        sessionManager = Alamofire.SessionManager.default
    }
    
    func fetchMovice (completionHandler: @escaping (Info?, Error?) -> Void) {
        fetchMovice(start: 0, count: 1) { (result: Result<Info>) in
            result.handle(value: { completionHandler($0, nil) }, orError: { completionHandler(nil, $0) })
        }
    }
    
    func fetchMovice (start: Int, count: Int, completionHandler: @escaping (Result<Info>) -> Void )  {
        sessionManager.request(Router.readMovie(start: start, count: count)).responseHandy { (response: DataResponse<Info>) in
            completionHandler(response.result)
        }
    }
}

