//
//  CompanyHomePageInfosConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CompanyHomePageInfosViewController: CompanyHomePageInfosPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension CompanyHomePageInfosInteractor: CompanyHomePageInfosViewControllerOutput
{
}

extension CompanyHomePageInfosPresenter: CompanyHomePageInfosInteractorOutput
{
}




// ============================================================================= //
// MARK: - CompanyHomePageInfosConfigurator Class Definition
// ============================================================================= //

class CompanyHomePageInfosConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: CompanyHomePageInfosConfigurator
    {
        let instance = CompanyHomePageInfosConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: CompanyHomePageInfosViewController)
    {
        let router = CompanyHomePageInfosRouter()
        router.viewController = viewController
        
        let presenter = CompanyHomePageInfosPresenter()
        presenter.output = viewController
        
        let interactor = CompanyHomePageInfosInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
