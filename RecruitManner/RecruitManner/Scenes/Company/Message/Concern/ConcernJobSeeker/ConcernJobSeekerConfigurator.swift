//
//  ConcernJobSeekerConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ConcernJobSeekerViewController: ConcernJobSeekerPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension ConcernJobSeekerInteractor: ConcernJobSeekerViewControllerOutput
{
}

extension ConcernJobSeekerPresenter: ConcernJobSeekerInteractorOutput
{
}




// ============================================================================= //
// MARK: - ConcernJobSeekerConfigurator Class Definition
// ============================================================================= //

class ConcernJobSeekerConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: ConcernJobSeekerConfigurator
    {
        let instance = ConcernJobSeekerConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: ConcernJobSeekerViewController)
    {
        let router = ConcernJobSeekerRouter()
        router.viewController = viewController
        
        let presenter = ConcernJobSeekerPresenter()
        presenter.output = viewController
        
        let interactor = ConcernJobSeekerInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
