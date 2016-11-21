//
//  PayAttentionCompanysConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension PayAttentionCompanysViewController: PayAttentionCompanysPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension PayAttentionCompanysInteractor: PayAttentionCompanysViewControllerOutput
{
}

extension PayAttentionCompanysPresenter: PayAttentionCompanysInteractorOutput
{
}




// ============================================================================= //
// MARK: - PayAttentionCompanysConfigurator Class Definition
// ============================================================================= //

class PayAttentionCompanysConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: PayAttentionCompanysConfigurator
    {
        let instance = PayAttentionCompanysConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: PayAttentionCompanysViewController)
    {
        let router = PayAttentionCompanysRouter()
        router.viewController = viewController
        
        let presenter = PayAttentionCompanysPresenter()
        presenter.output = viewController
        
        let interactor = PayAttentionCompanysInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
