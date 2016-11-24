//
//  CompanyTrackConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CompanyTrackViewController: CompanyTrackPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension CompanyTrackInteractor: CompanyTrackViewControllerOutput
{
}

extension CompanyTrackPresenter: CompanyTrackInteractorOutput
{
}




// ============================================================================= //
// MARK: - CompanyTrackConfigurator Class Definition
// ============================================================================= //

class CompanyTrackConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: CompanyTrackConfigurator
    {
        let instance = CompanyTrackConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: CompanyTrackViewController)
    {
        let router = CompanyTrackRouter()
        router.viewController = viewController
        
        let presenter = CompanyTrackPresenter()
        presenter.output = viewController
        
        let interactor = CompanyTrackInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
