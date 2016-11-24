//
//  JobCityConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/24.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobCityViewController: JobCityPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobCityInteractor: JobCityViewControllerOutput {
}

extension JobCityPresenter: JobCityInteractorOutput {
}




// ============================================================================= //
// MARK: - JobCityConfigurator Class Definition
// ============================================================================= //

class JobCityConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: JobCityConfigurator {
        let instance = JobCityConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobCityViewController) {
        let router = JobCityRouter()
        router.viewController = viewController
        
        let presenter = JobCityPresenter()
        presenter.output = viewController
        
        let interactor = JobCityInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
