//
//  JobApplicationRecordPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobApplicationRecordPresenterInput
{
    func presentSomething(response: JobApplicationRecord.Response)
}

protocol JobApplicationRecordPresenterOutput: class
{
    func displaySomething(viewModel: JobApplicationRecord.ViewModel)
}



// ============================================================================= //
// MARK: - JobApplicationRecordPresenter Class Definition
// ============================================================================= //

class JobApplicationRecordPresenter: JobApplicationRecordPresenterInput
{
    weak var output: JobApplicationRecordPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobApplicationRecord.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = JobApplicationRecord.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
