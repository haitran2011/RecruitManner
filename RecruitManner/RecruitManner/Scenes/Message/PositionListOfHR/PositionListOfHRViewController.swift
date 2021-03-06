//
//  PositionListOfHRViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol PositionListOfHRViewControllerInput
{
    func displaySomething(viewModel: PositionListOfHR.ViewModel)
}

protocol PositionListOfHRViewControllerOutput
{
    func doSomething(request: PositionListOfHR.Request)
}


// ============================================================================= //
// MARK: - PositionListOfHRViewController Class Definition
// ============================================================================= //
class PositionListOfHRViewController: UITableViewController, PositionListOfHRViewControllerInput
{
    var output: PositionListOfHRViewControllerOutput!
    var router: PositionListOfHRRouter!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        PositionListOfHRConfigurator.sharedInstance.configure(viewController:self)
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
        
        let request = PositionListOfHR.Request()
        output.doSomething(request: request)
    }
    
    // MARK: Display logic
    
    func displaySomething(viewModel: PositionListOfHR.ViewModel)
    {
        // NOTE: Display the result from the Presenter
        
        // nameTextField.text = viewModel.name
    }
}


extension PositionListOfHRViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "发布的职位 (5个)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellPositionListOfHRIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
}
