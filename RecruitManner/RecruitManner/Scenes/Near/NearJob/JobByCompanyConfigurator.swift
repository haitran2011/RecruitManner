//
//  JobByCompanyConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/18.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobByCompanyViewController: JobByCompanyPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobByCompanyInteractor: JobByCompanyViewControllerOutput {
}

extension JobByCompanyPresenter: JobByCompanyInteractorOutput {
}




// ============================================================================= //
// MARK: - JobByCompanyConfigurator Class Definition
// ============================================================================= //

class JobByCompanyConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: JobByCompanyConfigurator {
        let instance = JobByCompanyConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobByCompanyViewController) {

        let router = JobByCompanyRouter()
        router.viewController = viewController
        
        let presenter = JobByCompanyPresenter()
        presenter.output = viewController
        
        let interactor = JobByCompanyInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
