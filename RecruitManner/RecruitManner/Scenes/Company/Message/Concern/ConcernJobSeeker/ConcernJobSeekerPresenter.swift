//
//  ConcernJobSeekerPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol ConcernJobSeekerPresenterInput
{
    func presentSomething(response: ConcernJobSeeker.Response)
}

protocol ConcernJobSeekerPresenterOutput: class
{
    func displaySomething(viewModel: ConcernJobSeeker.ViewModel)
}



// ============================================================================= //
// MARK: - ConcernJobSeekerPresenter Class Definition
// ============================================================================= //

class ConcernJobSeekerPresenter: ConcernJobSeekerPresenterInput
{
    weak var output: ConcernJobSeekerPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: ConcernJobSeeker.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = ConcernJobSeeker.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
