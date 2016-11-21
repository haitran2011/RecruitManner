//
//  JobApplicationRecordConfigurator.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension JobApplicationRecordViewController: JobApplicationRecordPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue:segue)
    }
}

extension JobApplicationRecordInteractor: JobApplicationRecordViewControllerOutput
{
}

extension JobApplicationRecordPresenter: JobApplicationRecordInteractorOutput
{
}




// ============================================================================= //
// MARK: - JobApplicationRecordConfigurator Class Definition
// ============================================================================= //

class JobApplicationRecordConfigurator
{
    // MARK: Object lifecycle
    
    class var sharedInstance: JobApplicationRecordConfigurator
    {
        let instance = JobApplicationRecordConfigurator()
        return instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: JobApplicationRecordViewController)
    {
        let router = JobApplicationRecordRouter()
        router.viewController = viewController
        
        let presenter = JobApplicationRecordPresenter()
        presenter.output = viewController
        
        let interactor = JobApplicationRecordInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
