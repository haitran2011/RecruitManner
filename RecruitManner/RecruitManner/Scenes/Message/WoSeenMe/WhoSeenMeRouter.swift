//
//  WhoSeenMeRouter.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/17.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol WhoSeenMeRouterInput
{
    func navigateToSomewhere()
}


// ============================================================================= //
// MARK: - WhoSeenMeRouter Class Definition
// ============================================================================= //
class WhoSeenMeRouter: WhoSeenMeRouterInput
{
    weak var viewController: WhoSeenMeViewController!
    
    // MARK: Navigation
    
    func navigateToSomewhere()
    {
        print("WhoSeenMeRouter - navigateToSomeWhere called")
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    }
    
    // MARK: Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        print("WhoSeenMeRouter - passDataToNextScene called")
        // NOTE: Teach the router which scenes it can communicate with
        
        if segue.identifier == "ShowSomewhereScene" {
            passDataToSomewhereScene(segue: segue)
        }
    }
    
    func passDataToSomewhereScene(segue: UIStoryboardSegue)
    {
        print("WhoSeenMeRouter - passDataToSomewhereScene called")
        // NOTE: Teach the router how to pass data to the next scene
        
        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereViewController.output.name = viewController.output.name
    }
}
