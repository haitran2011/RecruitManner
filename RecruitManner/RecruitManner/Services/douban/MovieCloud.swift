//
//  MovieCloud.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/30.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation

public class MovieCloud: MovieDouBanProtocol {
    
    func fetchMovicesInfo (start: Int, count: Int, _ completionHandler: @escaping (_ info: () throws -> DoubanApi.Info) -> Void) {
        DoubanApi.shared.fetchMovice(start: 0, count: 1) { result in
            result.handleValue { it in
                completionHandler { it }
            }
            result.handleError { it in
                completionHandler { throw it }
            }
        }
    }
}
