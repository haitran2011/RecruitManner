//
//  JobSeekerOfNearbyPresenter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobSeekerOfNearbyPresenterInput
{
    func presentSomething(response: JobSeekerOfNearby.Response)
}

protocol JobSeekerOfNearbyPresenterOutput: class
{
    func displaySomething(viewModel: JobSeekerOfNearby.ViewModel)
}



// ============================================================================= //
// MARK: - JobSeekerOfNearbyPresenter Class Definition
// ============================================================================= //

class JobSeekerOfNearbyPresenter: JobSeekerOfNearbyPresenterInput
{
    weak var output: JobSeekerOfNearbyPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobSeekerOfNearby.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = JobSeekerOfNearby.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
