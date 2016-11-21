//
//  PositionListOfHRPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol PositionListOfHRPresenterInput
{
    func presentSomething(response: PositionListOfHR.Response)
}

protocol PositionListOfHRPresenterOutput: class
{
    func displaySomething(viewModel: PositionListOfHR.ViewModel)
}



// ============================================================================= //
// MARK: - PositionListOfHRPresenter Class Definition
// ============================================================================= //

class PositionListOfHRPresenter: PositionListOfHRPresenterInput
{
    weak var output: PositionListOfHRPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: PositionListOfHR.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = PositionListOfHR.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
