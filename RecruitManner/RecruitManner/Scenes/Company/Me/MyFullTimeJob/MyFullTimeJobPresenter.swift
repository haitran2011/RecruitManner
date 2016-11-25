//
//  MyFullTimeJobPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol MyFullTimeJobPresenterInput
{
    func presentSomething(response: MyFullTimeJob.Response)
}

protocol MyFullTimeJobPresenterOutput: class
{
    func displaySomething(viewModel: MyFullTimeJob.ViewModel)
}



// ============================================================================= //
// MARK: - MyFullTimeJobPresenter Class Definition
// ============================================================================= //

class MyFullTimeJobPresenter: MyFullTimeJobPresenterInput
{
    weak var output: MyFullTimeJobPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: MyFullTimeJob.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = MyFullTimeJob.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
