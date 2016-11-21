//
//  JobBySelectedPresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/19.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobBySelectedPresenterInput
{
    func presentSomething(response: JobBySelected.Response)
}

protocol JobBySelectedPresenterOutput: class
{
    func displaySomething(viewModel: JobBySelected.ViewModel)
}



// ============================================================================= //
// MARK: - JobBySelectedPresenter Class Definition
// ============================================================================= //

class JobBySelectedPresenter: JobBySelectedPresenterInput
{
    weak var output: JobBySelectedPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobBySelected.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        var viewModel = JobBySelected.ViewModel()
        viewModel.jobTypeArray = [salaryArray.map{JobBySelected.ViewModel.JobType( title: $0, isSelected: false )},
                                  workExperienceArray.map{JobBySelected.ViewModel.JobType( title: $0, isSelected: false)},
                                  educationArray.map{JobBySelected.ViewModel.JobType( title: $0, isSelected: false)},
                                  workTypeArray.map{JobBySelected.ViewModel.JobType( title: $0, isSelected: false)}]
        output.displaySomething(viewModel: viewModel)
    }
}
