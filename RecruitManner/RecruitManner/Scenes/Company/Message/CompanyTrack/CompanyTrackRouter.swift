//
//  CompanyTrackRouter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol CompanyTrackRouterInput
{
    func navigateToSomewhere()
}


// ============================================================================= //
// MARK: - CompanyTrackRouter Class Definition
// ============================================================================= //
class CompanyTrackRouter: CompanyTrackRouterInput
{
    weak var viewController: CompanyTrackViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere(){
    }
    
    // MARK: Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "segueShowSingleCompanyTrackScene" {
            passDataToSingleCompanyTrackScene(segue: segue)
        }
    }
    
    func passDataToSingleCompanyTrackScene(segue: UIStoryboardSegue)
    {
        print("CompanyTrackRouter - passDataToSingleCompanyTrackScene called")
        // NOTE: Teach the router how to pass data to the next scene
        
        let destinationController = segue.destination as! SingleCompanyTrackViewController
        destinationController.output.selectedCompany = viewController.output.selectedCompany
    }
}
