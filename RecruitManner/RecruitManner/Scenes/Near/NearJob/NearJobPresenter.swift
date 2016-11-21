//
//  NearJobPresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol NearJobPresenterInput {

    func presentSomething(response: NearJob.Response)
}

protocol NearJobPresenterOutput: class {

    func displaySomething(viewModel: NearJob.ViewModel)
}



// ============================================================================= //
// MARK: - NearJobPresenter Class Definition
// ============================================================================= //

class NearJobPresenter: NearJobPresenterInput {

    weak var output: NearJobPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: NearJob.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = NearJob.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
