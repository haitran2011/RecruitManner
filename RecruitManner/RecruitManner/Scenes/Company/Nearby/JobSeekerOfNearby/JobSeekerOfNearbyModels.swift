//
//  JobSeekerOfNearbyModels.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
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
// MARK: - JobSeekerOfNearbyModels Struct Definition
// ============================================================================= //

struct JobSeekerOfNearby
{
    // -> Interactor
    struct Request
    {
    }
    
    
    // -> Presenter
    struct Response
    {
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
    }
    
    static func virtualViewModelMock() -> ViewModel {
        let items = [ViewModel.JobSeekerItem(name: "姓名",
                                            userImageUlr: "",
                                            info: "深圳/5年/大专/22K-28K",
                                            mark: "标签",
                                            company: "公司",
                                            ageLimit: "2015.9-2016.7",
                                            deliveryTime: "15:00投递",
                                            logoImageUlr: "https://img3.doubanio.com/img/celebrity/small/230.jpg")]
        
        return ViewModel(jobSeekers: items)
    }
    
}
