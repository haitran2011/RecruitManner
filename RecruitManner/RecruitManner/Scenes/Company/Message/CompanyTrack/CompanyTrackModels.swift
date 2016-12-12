//
//  CompanyTrackModels.swift
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
// MARK: - CompanyTrackModels Struct Definition
// ============================================================================= //

struct CompanyTrack
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
        
        var total: Int?
        var count: Int?
        
        var companys: [String]?
    }
    
    static func virtualViewModelMock() -> ViewModel {
        let companys = ["深圳市华为有限公司", "TCL有限公司", "Apple有限公司"]
        return ViewModel(total: 3, count: 3, companys: companys)
    }
    
}
