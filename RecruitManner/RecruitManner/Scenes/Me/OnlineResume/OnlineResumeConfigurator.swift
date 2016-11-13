//
//  OnlineResumeConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/13.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension OnlineResumeViewController: OnlineResumePresenterOutput {
    
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        router.passDataToNextScene(segue:segue)
    }
}

extension OnlineResumeInteractor: OnlineResumeViewControllerOutput {
}

extension OnlineResumePresenter: OnlineResumeInteractorOutput {
}




// ============================================================================= //
// MARK: - OnlineResumeConfigurator Class Definition
// ============================================================================= //

class OnlineResumeConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: OnlineResumeConfigurator
    {
        let instance = OnlineResumeConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: OnlineResumeViewController)
    {
        let router = OnlineResumeRouter()
        router.viewController = viewController
        
        let presenter = OnlineResumePresenter()
        presenter.output = viewController
        
        let interactor = OnlineResumeInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
