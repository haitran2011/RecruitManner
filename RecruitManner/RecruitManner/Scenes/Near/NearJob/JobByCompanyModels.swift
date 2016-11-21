//
//  JobByCompanyModels.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/18.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

// ================================================================================================== //
// MARK: - The Flow (input and output protocol conformance to the triad).  How the connect.
//
//		request -> INTERACTOR -> response -> PRESENTER -> viewModel -> VIEWCONTROLLER -> request
//         |                         |                        |                             |
//     doSomething()          presentSomething()       displaySomething()              doSomething()
//
// ================================================================================================== //


// ============================================================================= //
// MARK: - JobByCompanyModels Struct Definition
// ============================================================================= //

struct JobByCompany
{
    // -> Interactor
    struct Request {
        var companyTitle: String? = nil
        
        var companys: [[JobByCompany.ViewModel.companyType]]? = nil
    }
    
    
    // -> Presenter
    typealias Response  = JobByCompany.Request
    
    // -> ViewController
    struct ViewModel {
        
        struct companyType {
            var title: String
            var isSelected: Bool
        }
        
        var companys: [[JobByCompany.ViewModel.companyType]] = []
    }
    
}

let sectionOne = ["未融资","天使轮","A轮","B轮",
                          "C轮","D轮及以上","上市公司","不需要融资"]

let sectionTwo = ["不限","移动及互联","电子商务","社交网络",
                          "企业服务","O2O","教育","游戏",
                          "旅游","金融","医疗健康","生活服务",
                          "信息安全","数据服务","广告营销","文化娱乐",
                          "硬件","分类信息","招聘","其他"]

