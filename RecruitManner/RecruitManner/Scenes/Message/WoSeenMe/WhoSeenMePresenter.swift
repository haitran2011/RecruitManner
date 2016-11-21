//
//  WhoSeenMePresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/17.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol WhoSeenMePresenterInput
{
    func presentSomething(response: WhoSeenMe.Response)
}

protocol WhoSeenMePresenterOutput: class
{
    func displaySomething(viewModel: WhoSeenMe.ViewModel)
}



// ============================================================================= //
// MARK: - WhoSeenMePresenter Class Definition
// ============================================================================= //

class WhoSeenMePresenter: WhoSeenMePresenterInput
{
    weak var output: WhoSeenMePresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: WhoSeenMe.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = WhoSeenMe.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
