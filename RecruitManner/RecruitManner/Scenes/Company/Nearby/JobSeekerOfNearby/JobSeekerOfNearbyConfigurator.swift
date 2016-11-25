//
//  JobSeekerOfNearbyConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobSeekerOfNearbyViewController: JobSeekerOfNearbyPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobSeekerOfNearbyInteractor: JobSeekerOfNearbyViewControllerOutput
{
}

extension JobSeekerOfNearbyPresenter: JobSeekerOfNearbyInteractorOutput
{
}




// ============================================================================= //
// MARK: - JobSeekerOfNearbyConfigurator Class Definition
// ============================================================================= //

class JobSeekerOfNearbyConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: JobSeekerOfNearbyConfigurator
    {
        let instance = JobSeekerOfNearbyConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobSeekerOfNearbyViewController)
    {
        let router = JobSeekerOfNearbyRouter()
        router.viewController = viewController
        
        let presenter = JobSeekerOfNearbyPresenter()
        presenter.output = viewController
        
        let interactor = JobSeekerOfNearbyInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
