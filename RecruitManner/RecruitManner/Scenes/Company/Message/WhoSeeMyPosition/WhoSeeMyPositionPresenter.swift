//
//  WhoSeeMyPositionPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol WhoSeeMyPositionPresenterInput
{
    func presentSomething(response: WhoSeeMyPosition.Response)
}

protocol WhoSeeMyPositionPresenterOutput: class
{
    func displaySomething(viewModel: WhoSeeMyPosition.ViewModel)
}



// ============================================================================= //
// MARK: - WhoSeeMyPositionPresenter Class Definition
// ============================================================================= //

class WhoSeeMyPositionPresenter: WhoSeeMyPositionPresenterInput
{
    weak var output: WhoSeeMyPositionPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: WhoSeeMyPosition.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = WhoSeeMyPosition.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
