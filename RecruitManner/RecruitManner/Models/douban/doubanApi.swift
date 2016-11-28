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
    
    private static let sharedInstance = DoubanApi()
    class public var shared: DoubanApi {
        return sharedInstance
    }
    
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
            
            return urlRequest
        }
    }
    
    func fetchMovice(start: Int, count: Int, completionHandler: @escaping (Info?, Error?) -> Void) {
        Alamofire.request(Router.readMovie(start: start, count: count))
            .responseHandy { (response: DataResponse<Info>) in
                switch response.result {
                case .success(let value):
                    completionHandler(value, nil)
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
}
