//
//  MyJobOffersPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol MyJobOffersPresenterInput
{
    func presentSomething(response: MyJobOffers.Response)
}

protocol MyJobOffersPresenterOutput: class
{
    func displaySomething(viewModel: MyJobOffers.ViewModel)
}



// ============================================================================= //
// MARK: - MyJobOffersPresenter Class Definition
// ============================================================================= //

class MyJobOffersPresenter: MyJobOffersPresenterInput
{
    weak var output: MyJobOffersPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: MyJobOffers.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = MyJobOffers.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
