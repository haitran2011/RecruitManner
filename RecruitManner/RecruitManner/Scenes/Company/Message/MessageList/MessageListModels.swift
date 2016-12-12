//
//  MessageListModels.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/9.
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
// MARK: - MessageListModels Struct Definition
// ============================================================================= //

struct MessageList
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
        
        struct ItemAccInfo {
            var logo: String?
            var info: String?
            var date: String?
        }
        
        struct ItemInfo {
            var logo: String?
            var info: String?
        }
        
        var infoNewResume: ItemAccInfo?
        var infoCompanyTrack: ItemInfo?
        var infoConcern: ItemAccInfo?
        var infoWhoSeeMy: ItemInfo?
        var infoSystem: ItemAccInfo?
    }
    
    static func virtualViewModelMock() -> ViewModel {
        var viewModel = ViewModel()
        viewModel.infoNewResume = ViewModel.ItemAccInfo(logo: "", info: "[高级JAVA开发工程师]陈婷的简历", date: "01月10日")
        viewModel.infoCompanyTrack = ViewModel.ItemInfo(logo: "",info: "[高级JAVA开发工程师]陈婷的简历")
        viewModel.infoConcern = ViewModel.ItemAccInfo(logo: "", info: "[高级JAVA开发工程师]陈婷的简历", date: "09月10日")
        viewModel.infoWhoSeeMy = ViewModel.ItemInfo(logo: "",info: "[高级JAVA开发工程师]陈婷的简历")
        viewModel.infoSystem = ViewModel.ItemAccInfo(logo: "", info: "xxxxxxx(未读)", date: "09月18日")
        return viewModel
    }
    
}
