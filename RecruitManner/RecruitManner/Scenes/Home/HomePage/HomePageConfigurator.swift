//
//  HomePageConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension HomePageViewController: HomePagePresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension HomePageInteractor: HomePageViewControllerOutput
{
}

extension HomePagePresenter: HomePageInteractorOutput
{
}




// ============================================================================= //
// MARK: - HomePageConfigurator Class Definition
// ============================================================================= //

class HomePageConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: HomePageConfigurator
    {
        let instance = HomePageConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: HomePageViewController)
    {
        let router = HomePageRouter()
        router.viewController = viewController
        
        let presenter = HomePagePresenter()
        presenter.output = viewController
        
        let interactor = HomePageInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
