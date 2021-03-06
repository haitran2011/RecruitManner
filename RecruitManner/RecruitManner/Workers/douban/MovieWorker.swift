//
//  MovieWorker.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/30.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation

// MARK: - Movie worker

class MovieWorker {
    var store: MovieDouBanProtocol
    
    init(store: MovieDouBanProtocol) {
        self.store = store
    }
    
    func fetchMovicesInfo (start: Int, count: Int, completion handler: @escaping (DoubanApi.Info?) -> Void) {
        store.fetchMovicesInfo(start: start, count: count) { (info: () throws -> DoubanApi.Info) -> Void in
            do {
                let info = try info()
                handler(info)
            } catch {
                handler(nil)
            }
        }
    }
}


// MARK: - Movie DouBan API

protocol MovieDouBanProtocol {
    
    // MARK: CRUD operations - Inner closure
    func fetchMovicesInfo (start: Int, count: Int, completion handler: @escaping (_ info: () throws -> DoubanApi.Info) -> Void)
}
