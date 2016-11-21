//
//  JobDetailConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobDetailViewController: JobDetailPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobDetailInteractor: JobDetailViewControllerOutput
{
}

extension JobDetailPresenter: JobDetailInteractorOutput
{
}




// ============================================================================= //
// MARK: - JobDetailConfigurator Class Definition
// ============================================================================= //

class JobDetailConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: JobDetailConfigurator
    {
        let instance = JobDetailConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobDetailViewController)
    {
        let router = JobDetailRouter()
        router.viewController = viewController
        
        let presenter = JobDetailPresenter()
        presenter.output = viewController
        
        let interactor = JobDetailInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
