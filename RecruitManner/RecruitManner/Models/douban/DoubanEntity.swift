//
//  DoubanEntity.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation
import HandyJSON

struct DoubanEntity {
    
    struct Info: HandyJSON {
        var count: Int?
        var start: Int?
        var total: Int?
        var title: String?
        
//        var description: String {
//            return
//        }
    }
    
    static func toJSON<T : HandyJSON>(model: T) -> String? {
        return JSONSerializer.serialize(model: model).toJSON()
    }
}
