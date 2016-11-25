//
//  CompanyLabelConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CompanyLabelViewController: CompanyLabelPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue:segue)
    }
}

extension CompanyLabelInteractor: CompanyLabelViewControllerOutput {
}

extension CompanyLabelPresenter: CompanyLabelInteractorOutput {
}




// ============================================================================= //
// MARK: - CompanyLabelConfigurator Class Definition
// ============================================================================= //

class CompanyLabelConfigurator {

    // MARK: Object lifecycle
    
    class var sharedInstance: CompanyLabelConfigurator {
        let instance = CompanyLabelConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: CompanyLabelViewController) {
        let router = CompanyLabelRouter()
        router.viewController = viewController
        
        let presenter = CompanyLabelPresenter()
        presenter.output = viewController
        
        let interactor = CompanyLabelInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
