//
//  OnlineResumePresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/13.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol OnlineResumePresenterInput
{
    func presentSomething(response: OnlineResume.Response)
}

protocol OnlineResumePresenterOutput: class
{
    func displaySomething(viewModel: OnlineResume.ViewModel)
}



// ============================================================================= //
// MARK: - OnlineResumePresenter Class Definition
// ============================================================================= //

class OnlineResumePresenter: OnlineResumePresenterInput
{
    weak var output: OnlineResumePresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: OnlineResume.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = OnlineResume.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
