//
//  OccupationalHistoryListConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/14.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension OccupationalHistoryListViewController: OccupationalHistoryListPresenterOutput
{
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension OccupationalHistoryListInteractor: OccupationalHistoryListViewControllerOutput
{
}

extension OccupationalHistoryListPresenter: OccupationalHistoryListInteractorOutput
{
}




// ============================================================================= //
// MARK: - OccupationalHistoryListConfigurator Class Definition
// ============================================================================= //

class OccupationalHistoryListConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: OccupationalHistoryListConfigurator
    {
        let instance = OccupationalHistoryListConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: OccupationalHistoryListViewController)
    {
        let router = OccupationalHistoryListRouter()
        router.viewController = viewController
        
        let presenter = OccupationalHistoryListPresenter()
        presenter.output = viewController
        
        let interactor = OccupationalHistoryListInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
