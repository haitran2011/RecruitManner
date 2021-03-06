//
//  MovieCloud.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/30.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation

public class MovieCloud: MovieDouBanProtocol {
    
    func fetchMovicesInfo (start: Int, count: Int, completion handler: @escaping (_ info: () throws -> DoubanApi.Info) -> Void) {
        DoubanApi.shared.fetchMovice(start: 0, count: 1) { result in
            result.handleValue { it in
                handler { it }
            }
            result.handleError { it in
                handler { throw it }
            }
        }
    }
}
