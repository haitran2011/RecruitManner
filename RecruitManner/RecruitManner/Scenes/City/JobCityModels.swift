//
//  JobCityModels.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/24.
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
// MARK: - JobCityModels Struct Definition
// ============================================================================= //

struct JobCity {

    // -> Interactor
    struct Request {
    }
    
    
    // -> Presenter
    struct Response {
    }
    
    // -> ViewController
    struct ViewModel {
    }
    
}
