//
//  ConcernCompanyRouter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol ConcernCompanyRouterInput
{
    func navigateToSomewhere()
}


// ============================================================================= //
// MARK: - ConcernCompanyRouter Class Definition
// ============================================================================= //
class ConcernCompanyRouter: ConcernCompanyRouterInput
{
    weak var viewController: ConcernCompanyViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere(){
    }
    
    // MARK: Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "segueShowConcernJobSeekersScene" {
            passDataToConcernJobSeekersScene(segue: segue)
        }
    }
    
    func passDataToConcernJobSeekersScene(segue: UIStoryboardSegue)
    {
        print("ConcernCompanyRouter - passDataToSomewhereScene called")
        // NOTE: Teach the router how to pass data to the next scene
        
        let destinationController = segue.destination as! ConcernJobSeekerViewController
        destinationController.output.selectedCompany = viewController.output.selectedCompany
    }
}
