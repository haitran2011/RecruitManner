//
//  CompanyLabelPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol CompanyLabelPresenterInput {

    func presentSomething(response: CompanyLabel.Response)
}

protocol CompanyLabelPresenterOutput: class {

    func displaySomething(viewModel: CompanyLabel.ViewModel)
}



// ============================================================================= //
// MARK: - CompanyLabelPresenter Class Definition
// ============================================================================= //

class CompanyLabelPresenter: CompanyLabelPresenterInput {

    weak var output: CompanyLabelPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: CompanyLabel.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = CompanyLabel.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
