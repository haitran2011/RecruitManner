//
//  PayAttentionCompanysPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol PayAttentionCompanysPresenterInput
{
    func presentSomething(response: PayAttentionCompanys.Response)
}

protocol PayAttentionCompanysPresenterOutput: class
{
    func displaySomething(viewModel: PayAttentionCompanys.ViewModel)
}



// ============================================================================= //
// MARK: - PayAttentionCompanysPresenter Class Definition
// ============================================================================= //

class PayAttentionCompanysPresenter: PayAttentionCompanysPresenterInput
{
    weak var output: PayAttentionCompanysPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: PayAttentionCompanys.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = PayAttentionCompanys.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
