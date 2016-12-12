//
//  MessageListPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/9.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol MessageListPresenterInput {
    
    func presentNewResumesInfo(response: MessageList.Response)
    
    func presentCompanyTrackInfo(response: MessageList.Response)
    
    func presentConcernInfo(response: MessageList.Response)

    func presentWhoSeeMyInfo(response: MessageList.Response)
    
    func presentSystemInfo(response: MessageList.Response)
}

protocol MessageListPresenterOutput: class {
    
    func displayNewResumesInfo(viewModel: MessageList.ViewModel)
    
    func displayCompanyTrackInfo(viewModel: MessageList.ViewModel)
    
    func displayConcernInfo(viewModel: MessageList.ViewModel)
    
    func displayWhoSeeMyInfo(viewModel: MessageList.ViewModel)
    
    func displaySystemInfo(viewModel: MessageList.ViewModel)
}



// ============================================================================= //
// MARK: - MessageListPresenter Class Definition
// ============================================================================= //

class MessageListPresenter: MessageListPresenterInput
{
    weak var output: MessageListPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentNewResumesInfo(response: MessageList.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = MessageList.virtualViewModelMock()
        output.displayNewResumesInfo(viewModel: viewModel)
    }
    
    func presentCompanyTrackInfo(response: MessageList.Response) {
        let viewModel = MessageList.virtualViewModelMock()
        output.displayCompanyTrackInfo(viewModel: viewModel)
    }
    
    func presentConcernInfo(response: MessageList.Response) {
        let viewModel = MessageList.virtualViewModelMock()
        output.displayConcernInfo(viewModel: viewModel)
    }
    
    func presentWhoSeeMyInfo(response: MessageList.Response) {
        let viewModel = MessageList.virtualViewModelMock()
        output.displayWhoSeeMyInfo(viewModel: viewModel)
    }
    
    func presentSystemInfo(response: MessageList.Response) {
        let viewModel = MessageList.virtualViewModelMock()
        output.displaySystemInfo(viewModel: viewModel)
    }
}
