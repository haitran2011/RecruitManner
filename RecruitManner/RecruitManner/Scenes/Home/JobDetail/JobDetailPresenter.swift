//
//  JobDetailPresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobDetailPresenterInput
{
    func presentSomething(response: JobDetail.Response)
}

protocol JobDetailPresenterOutput: class
{
    func displaySomething(viewModel: JobDetail.ViewModel)
}



// ============================================================================= //
// MARK: - JobDetailPresenter Class Definition
// ============================================================================= //

class JobDetailPresenter: JobDetailPresenterInput
{
    weak var output: JobDetailPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobDetail.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = JobDetail.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
