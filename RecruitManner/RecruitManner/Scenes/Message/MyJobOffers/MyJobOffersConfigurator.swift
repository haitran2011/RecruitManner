//
//  MyJobOffersConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension MyJobOffersViewController: MyJobOffersPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension MyJobOffersInteractor: MyJobOffersViewControllerOutput
{
}

extension MyJobOffersPresenter: MyJobOffersInteractorOutput
{
}




// ============================================================================= //
// MARK: - MyJobOffersConfigurator Class Definition
// ============================================================================= //

class MyJobOffersConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: MyJobOffersConfigurator
    {
        let instance = MyJobOffersConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: MyJobOffersViewController)
    {
        let router = MyJobOffersRouter()
        router.viewController = viewController
        
        let presenter = MyJobOffersPresenter()
        presenter.output = viewController
        
        let interactor = MyJobOffersInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
