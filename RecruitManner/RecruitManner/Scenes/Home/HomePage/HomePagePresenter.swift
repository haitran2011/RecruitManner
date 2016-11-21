//
//  HomePagePresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol HomePagePresenterInput
{
    func presentSomething(response: HomePage.Response)
}

protocol HomePagePresenterOutput: class
{
    func displaySomething(viewModel: HomePage.ViewModel)
}



// ============================================================================= //
// MARK: - HomePagePresenter Class Definition
// ============================================================================= //

class HomePagePresenter: HomePagePresenterInput
{
    weak var output: HomePagePresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: HomePage.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = HomePage.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
