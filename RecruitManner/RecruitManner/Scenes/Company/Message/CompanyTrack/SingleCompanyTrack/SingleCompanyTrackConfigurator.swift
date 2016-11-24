//
//  SingleCompanyTrackConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension SingleCompanyTrackViewController: SingleCompanyTrackPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension SingleCompanyTrackInteractor: SingleCompanyTrackViewControllerOutput {
}

extension SingleCompanyTrackPresenter: SingleCompanyTrackInteractorOutput {
}




// ============================================================================= //
// MARK: - SingleCompanyTrackConfigurator Class Definition
// ============================================================================= //

class SingleCompanyTrackConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: SingleCompanyTrackConfigurator {
        let instance = SingleCompanyTrackConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: SingleCompanyTrackViewController) {
        let router = SingleCompanyTrackRouter()
        router.viewController = viewController
        
        let presenter = SingleCompanyTrackPresenter()
        presenter.output = viewController
        
        let interactor = SingleCompanyTrackInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
