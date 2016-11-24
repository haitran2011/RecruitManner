//
//  ConcernCompanyConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ConcernCompanyViewController: ConcernCompanyPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension ConcernCompanyInteractor: ConcernCompanyViewControllerOutput
{
}

extension ConcernCompanyPresenter: ConcernCompanyInteractorOutput
{
}




// ============================================================================= //
// MARK: - ConcernCompanyConfigurator Class Definition
// ============================================================================= //

class ConcernCompanyConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: ConcernCompanyConfigurator
    {
        let instance = ConcernCompanyConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: ConcernCompanyViewController)
    {
        let router = ConcernCompanyRouter()
        router.viewController = viewController
        
        let presenter = ConcernCompanyPresenter()
        presenter.output = viewController
        
        let interactor = ConcernCompanyInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
