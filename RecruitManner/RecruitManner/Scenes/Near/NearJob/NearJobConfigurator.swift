//
//  NearJobConfigurator.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension NearJobViewController: NearJobPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension NearJobInteractor: NearJobViewControllerOutput {
}

extension NearJobPresenter: NearJobInteractorOutput {
}




// ============================================================================= //
// MARK: - NearJobConfigurator Class Definition
// ============================================================================= //

class NearJobConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: NearJobConfigurator {
        let instance = NearJobConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: NearJobViewController) {
        let router = NearJobRouter()
        router.viewController = viewController
        
        let presenter = NearJobPresenter()
        presenter.output = viewController
        
        let interactor = NearJobInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
