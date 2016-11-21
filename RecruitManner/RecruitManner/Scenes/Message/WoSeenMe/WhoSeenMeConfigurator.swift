//
//  WhoSeenMeConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/17.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension WhoSeenMeViewController: WhoSeenMePresenterOutput
{
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension WhoSeenMeInteractor: WhoSeenMeViewControllerOutput
{
}

extension WhoSeenMePresenter: WhoSeenMeInteractorOutput
{
}




// ============================================================================= //
// MARK: - WhoSeenMeConfigurator Class Definition
// ============================================================================= //

class WhoSeenMeConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: WhoSeenMeConfigurator
    {
        let instance = WhoSeenMeConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: WhoSeenMeViewController)
    {
        let router = WhoSeenMeRouter()
        router.viewController = viewController
        
        let presenter = WhoSeenMePresenter()
        presenter.output = viewController
        
        let interactor = WhoSeenMeInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
