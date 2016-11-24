//
//  CompanyTrackPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol CompanyTrackPresenterInput
{
    func presentSomething(response: CompanyTrack.Response)
}

protocol CompanyTrackPresenterOutput: class
{
    func displaySomething(viewModel: CompanyTrack.ViewModel)
}



// ============================================================================= //
// MARK: - CompanyTrackPresenter Class Definition
// ============================================================================= //

class CompanyTrackPresenter: CompanyTrackPresenterInput
{
    weak var output: CompanyTrackPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: CompanyTrack.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = CompanyTrack.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
