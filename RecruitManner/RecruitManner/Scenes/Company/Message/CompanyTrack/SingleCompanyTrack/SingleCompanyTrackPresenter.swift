//
//  SingleCompanyTrackPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol SingleCompanyTrackPresenterInput {

    func presentSlideTabedBar(response: SingleCompanyTrack.Response)
    
    func presentCompanyName(response: SingleCompanyTrack.Response)
    
    func presentResumeTable(response: SingleCompanyTrack.Response)
}

protocol SingleCompanyTrackPresenterOutput: class {

    func displayCompanyName(viewModel: SingleCompanyTrack.ViewModel)
    
    func displaySlideTabedBar(viewModel: SingleCompanyTrack.ViewModel)
    
    func displayTable(viewModel: SingleCompanyTrack.ViewModel)
}



// ============================================================================= //
// MARK: - SingleCompanyTrackPresenter Class Definition
// ============================================================================= //

class SingleCompanyTrackPresenter: SingleCompanyTrackPresenterInput {

    weak var output: SingleCompanyTrackPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSlideTabedBar(response: SingleCompanyTrack.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = SingleCompanyTrack.virtualViewModelMock()
        
        output.displaySlideTabedBar(viewModel: viewModel)
        
    }
    
    func presentCompanyName(response: SingleCompanyTrack.Response) {
        
        var viewModel = SingleCompanyTrack.ViewModel()
        viewModel.companyName = response.companyName
        output.displayCompanyName(viewModel: viewModel)
    }
    
    func presentResumeTable(response: SingleCompanyTrack.Response) {
        
        var viewModel = SingleCompanyTrack.virtualViewModelMock()
        viewModel.index = response.index
        output.displayTable(viewModel: viewModel)
    }
}
