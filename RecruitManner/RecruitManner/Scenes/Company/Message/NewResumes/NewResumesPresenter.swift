//
//  NewResumesPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol NewResumesPresenterInput
{
    func presentSomething(response: NewResumes.Response)
}

protocol NewResumesPresenterOutput: class
{
    func displaySomething(viewModel: NewResumes.ViewModel)
}



// ============================================================================= //
// MARK: - NewResumesPresenter Class Definition
// ============================================================================= //

class NewResumesPresenter: NewResumesPresenterInput
{
    weak var output: NewResumesPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: NewResumes.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = NewResumes.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
