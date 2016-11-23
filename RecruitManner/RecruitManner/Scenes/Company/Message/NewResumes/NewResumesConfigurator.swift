//
//  NewResumesConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension NewResumesViewController: NewResumesPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension NewResumesInteractor: NewResumesViewControllerOutput
{
}

extension NewResumesPresenter: NewResumesInteractorOutput
{
}




// ============================================================================= //
// MARK: - NewResumesConfigurator Class Definition
// ============================================================================= //

class NewResumesConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: NewResumesConfigurator
    {
        let instance = NewResumesConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: NewResumesViewController)
    {
        let router = NewResumesRouter()
        router.viewController = viewController
        
        let presenter = NewResumesPresenter()
        presenter.output = viewController
        
        let interactor = NewResumesInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
