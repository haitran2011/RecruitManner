//
//  PositionListOfHRConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension PositionListOfHRViewController: PositionListOfHRPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension PositionListOfHRInteractor: PositionListOfHRViewControllerOutput
{
}

extension PositionListOfHRPresenter: PositionListOfHRInteractorOutput
{
}




// ============================================================================= //
// MARK: - PositionListOfHRConfigurator Class Definition
// ============================================================================= //

class PositionListOfHRConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: PositionListOfHRConfigurator
    {
        let instance = PositionListOfHRConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: PositionListOfHRViewController)
    {
        let router = PositionListOfHRRouter()
        router.viewController = viewController
        
        let presenter = PositionListOfHRPresenter()
        presenter.output = viewController
        
        let interactor = PositionListOfHRInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
