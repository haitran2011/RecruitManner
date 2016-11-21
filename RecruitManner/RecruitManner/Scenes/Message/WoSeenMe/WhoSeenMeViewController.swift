//
//  WhoSeenMeViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/17.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol WhoSeenMeViewControllerInput
{
    func displaySomething(viewModel: WhoSeenMe.ViewModel)
}

protocol WhoSeenMeViewControllerOutput
{
    func doSomething(request: WhoSeenMe.Request)
}


// ============================================================================= //
// MARK: - WhoSeenMeViewController Class Definition
// ============================================================================= //
class WhoSeenMeViewController: UITableViewController, WhoSeenMeViewControllerInput
{
    var output: WhoSeenMeViewControllerOutput!
    var router: WhoSeenMeRouter!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        WhoSeenMeConfigurator.sharedInstance.configure(viewController:self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomethingOnLoad()
    }
    
    // MARK: Event handling
    
    func doSomethingOnLoad()
    {
        // NOTE: Ask the Interactor to do some work
        
        let request = WhoSeenMe.Request()
        output.doSomething(request: request)
    }
    
    // MARK: Display logic
    
    func displaySomething(viewModel: WhoSeenMe.ViewModel)
    {
        // NOTE: Display the result from the Presenter
        
        // nameTextField.text = viewModel.name
    }
}

extension WhoSeenMeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellWhoSeenMeIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
}


