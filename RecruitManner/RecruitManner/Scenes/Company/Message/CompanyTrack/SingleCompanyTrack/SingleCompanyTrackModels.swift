//
//  SingleCompanyTrackModels.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
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
// MARK: - SingleCompanyTrackModels Struct Definition
// ============================================================================= //

struct SingleCompanyTrack {

    // -> Interactor
    struct Request {
    }
    
    // -> Presenter
    struct Response {
        
        var companyName: String?
        var index: Int?
    }
    
    // -> ViewController
    struct ViewModel {
        
        struct JobSeekerItem {
            var name: String?
            var userImageUlr: String?
            var info: String?
            var mark: String?
            var company: String?
            var ageLimit: String?
            var deliveryTime: String?
            var logoImageUlr: String?
        }
        
        var jobSeekers: [JobSeekerItem]?
        var index: Int?
        
        var companyName: String?
        var barItems: [String]?
    }
    
    static func virtualViewModelMock() -> ViewModel {
        
        var viewModel = ViewModel()
        let companys = ["深圳市华为有限公司", "TCL有限公司", "Apple有限公司"]
        viewModel.companyName = companys[1]
        viewModel.barItems = ["HR经理", "销售", "Web前端"]
        viewModel.index = 0
        viewModel.jobSeekers = [ViewModel.JobSeekerItem(name: "姓名",
                                             userImageUlr: "",
                                             info: "深圳/5年/大专/22K-28K",
                                             mark: "标签",
                                             company: "公司",
                                             ageLimit: "2015.9-2016.7",
                                             deliveryTime: "15:00投递",
                                             logoImageUlr: "https://img3.doubanio.com/img/celebrity/small/230.jpg")]
        return viewModel
    }
    
}
