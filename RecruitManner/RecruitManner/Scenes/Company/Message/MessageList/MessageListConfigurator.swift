//
//  MessageListConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/9.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension MessageListViewController: MessageListPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension MessageListInteractor: MessageListViewControllerOutput
{
}

extension MessageListPresenter: MessageListInteractorOutput
{
}




// ============================================================================= //
// MARK: - MessageListConfigurator Class Definition
// ============================================================================= //

class MessageListConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: MessageListConfigurator
    {
        let instance = MessageListConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: MessageListViewController)
    {
        let router = MessageListRouter()
        router.viewController = viewController
        
        let presenter = MessageListPresenter()
        presenter.output = viewController
        
        let interactor = MessageListInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
