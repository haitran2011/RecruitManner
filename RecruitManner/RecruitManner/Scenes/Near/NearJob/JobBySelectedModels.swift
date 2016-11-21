//
//  JobBySelectedModels.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/19.
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
// MARK: - JobBySelectedModels Struct Definition
// ============================================================================= //

struct JobBySelected
{
    // -> Interactor
    struct Request
    {
    }
    
    
    // -> Presenter
    struct Response
    {
        
        var jobTypeArray:[[JobBySelected.ViewModel.JobType]] = []
    }
    
    // -> ViewController
    struct ViewModel
    {
        struct JobType {
            var title: String
            var isSelected: Bool
        }
        
        var jobTypeArray: [[JobBySelected.ViewModel.JobType]] = []
    }
    
}

let salaryArray = ["不限","2K以下","2K-5K","5K-10K",
                   "10K-15K","15K-25K","25K-50K","50K以上"]

let workExperienceArray = ["应届毕业生","3年以下","3－5年",
                           "5-10年","10年以上","经验不限"]

let educationArray = ["大专","本科","硕士","博士","不要求"]

let workTypeArray = ["全职","兼职","实习"]
