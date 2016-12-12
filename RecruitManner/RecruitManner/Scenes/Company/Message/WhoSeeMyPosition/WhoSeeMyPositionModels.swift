//
//  WhoSeeMyPositionModels.swift
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
// MARK: - WhoSeeMyPositionModels Struct Definition
// ============================================================================= //

struct WhoSeeMyPosition
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
        
        var items: [WhoSeeMyCellView.ViewModel]?
    }
    
    static func virtualViewModelMock() -> ViewModel {
        
        var viewModel = ViewModel()
        viewModel.items = [WhoSeeMyCellView.ViewModel(logoImage: "https://img3.doubanio.com/img/celebrity/small/230.jpg",
                                                      name: "张小龙查看了\"Java架构师\"",
                                                      describe: "8年／本科／44K-55K/深圳",
                                                      time: Date(),
                                                      tabImage: nil)]
        return viewModel
    }
}
