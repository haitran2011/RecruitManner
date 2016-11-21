//
//  JobBySelectedConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/19.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobBySelectedViewController: JobBySelectedPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobBySelectedInteractor: JobBySelectedViewControllerOutput {
}

extension JobBySelectedPresenter: JobBySelectedInteractorOutput {
}




// ============================================================================= //
// MARK: - JobBySelectedConfigurator Class Definition
// ============================================================================= //

class JobBySelectedConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: JobBySelectedConfigurator {
        let instance = JobBySelectedConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobBySelectedViewController) {

        let router = JobBySelectedRouter()
        router.viewController = viewController
        
        let presenter = JobBySelectedPresenter()
        presenter.output = viewController
        
        let interactor = JobBySelectedInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
