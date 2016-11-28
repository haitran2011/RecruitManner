//
//  CompanyHomePageInfosPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol CompanyHomePageInfosPresenterInput
{
    func presentSomething(response: CompanyHomePageInfos.Response)
}

protocol CompanyHomePageInfosPresenterOutput: class
{
    func displaySomething(viewModel: CompanyHomePageInfos.ViewModel)
}



// ============================================================================= //
// MARK: - CompanyHomePageInfosPresenter Class Definition
// ============================================================================= //

class CompanyHomePageInfosPresenter: CompanyHomePageInfosPresenterInput
{
    weak var output: CompanyHomePageInfosPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: CompanyHomePageInfos.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = CompanyHomePageInfos.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
