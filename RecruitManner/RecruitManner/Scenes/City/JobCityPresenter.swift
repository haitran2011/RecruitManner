//
//  JobCityPresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/24.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobCityPresenterInput {

    func presentSomething(response: JobCity.Response)
}

protocol JobCityPresenterOutput: class {

    func displaySomething(viewModel: JobCity.ViewModel)
}



// ============================================================================= //
// MARK: - JobCityPresenter Class Definition
// ============================================================================= //

class JobCityPresenter: JobCityPresenterInput {

    weak var output: JobCityPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobCity.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = JobCity.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
