//
//  ConcernCompanyPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol ConcernCompanyPresenterInput
{
    func presentSomething(response: ConcernCompany.Response)
}

protocol ConcernCompanyPresenterOutput: class
{
    func displaySomething(viewModel: ConcernCompany.ViewModel)
}



// ============================================================================= //
// MARK: - ConcernCompanyPresenter Class Definition
// ============================================================================= //

class ConcernCompanyPresenter: ConcernCompanyPresenterInput
{
    weak var output: ConcernCompanyPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: ConcernCompany.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = ConcernCompany.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
