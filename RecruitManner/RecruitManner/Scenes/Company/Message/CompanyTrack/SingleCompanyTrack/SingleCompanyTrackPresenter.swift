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

    func presentSomething(response: SingleCompanyTrack.Response)
}

protocol SingleCompanyTrackPresenterOutput: class {

    func displaySomething(viewModel: SingleCompanyTrack.ViewModel)
}



// ============================================================================= //
// MARK: - SingleCompanyTrackPresenter Class Definition
// ============================================================================= //

class SingleCompanyTrackPresenter: SingleCompanyTrackPresenterInput {

    weak var output: SingleCompanyTrackPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: SingleCompanyTrack.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = SingleCompanyTrack.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
