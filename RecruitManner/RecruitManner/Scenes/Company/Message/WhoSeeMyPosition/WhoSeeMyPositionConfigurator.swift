//
//  WhoSeeMyPositionConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension WhoSeeMyPositionViewController: WhoSeeMyPositionPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension WhoSeeMyPositionInteractor: WhoSeeMyPositionViewControllerOutput
{
}

extension WhoSeeMyPositionPresenter: WhoSeeMyPositionInteractorOutput
{
}




// ============================================================================= //
// MARK: - WhoSeeMyPositionConfigurator Class Definition
// ============================================================================= //

class WhoSeeMyPositionConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: WhoSeeMyPositionConfigurator
    {
        let instance = WhoSeeMyPositionConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: WhoSeeMyPositionViewController)
    {
        let router = WhoSeeMyPositionRouter()
        router.viewController = viewController
        
        let presenter = WhoSeeMyPositionPresenter()
        presenter.output = viewController
        
        let interactor = WhoSeeMyPositionInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
