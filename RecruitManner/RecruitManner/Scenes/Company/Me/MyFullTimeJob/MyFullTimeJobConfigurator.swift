//
//  MyFullTimeJobConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension MyFullTimeJobViewController: MyFullTimeJobPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension MyFullTimeJobInteractor: MyFullTimeJobViewControllerOutput
{
}

extension MyFullTimeJobPresenter: MyFullTimeJobInteractorOutput
{
}




// ============================================================================= //
// MARK: - MyFullTimeJobConfigurator Class Definition
// ============================================================================= //

class MyFullTimeJobConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: MyFullTimeJobConfigurator
    {
        let instance = MyFullTimeJobConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: MyFullTimeJobViewController)
    {
        let router = MyFullTimeJobRouter()
        router.viewController = viewController
        
        let presenter = MyFullTimeJobPresenter()
        presenter.output = viewController
        
        let interactor = MyFullTimeJobInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
