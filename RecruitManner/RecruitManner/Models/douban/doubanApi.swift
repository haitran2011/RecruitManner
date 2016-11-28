//
//  File.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation
import Alamofire

struct DoubanApi {
    
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
            default:
                return [:]
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try Router.baseURLString.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            switch self {
            case .readMovie(let start, let count):
                 urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            }
            
            return urlRequest
        }
    }
    
}
