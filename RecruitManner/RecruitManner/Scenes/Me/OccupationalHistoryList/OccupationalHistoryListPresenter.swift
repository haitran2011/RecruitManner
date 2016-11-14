//
//  OccupationalHistoryListPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/14.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol OccupationalHistoryListPresenterInput
{
    func presentSomething(response: OccupationalHistoryList.Response)
}

protocol OccupationalHistoryListPresenterOutput: class
{
    func displaySomething(viewModel: OccupationalHistoryList.ViewModel)
}



// ============================================================================= //
// MARK: - OccupationalHistoryListPresenter Class Definition
// ============================================================================= //

class OccupationalHistoryListPresenter: OccupationalHistoryListPresenterInput
{
    weak var output: OccupationalHistoryListPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: OccupationalHistoryList.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = OccupationalHistoryList.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
