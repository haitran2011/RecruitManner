//
//  CompanyTrackViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CompanyTrackViewControllerInput
{
    func displayTable(viewModel: CompanyTrack.ViewModel)
}

protocol CompanyTrackViewControllerOutput
{
    func doFetchCompanyTracks(request: CompanyTrack.Request)
    var selectedCompany: String? { get set }
}


// ============================================================================= //
// MARK: - CompanyTrackViewController Class Definition
// ============================================================================= //
class CompanyTrackViewController: UITableViewController, CompanyTrackViewControllerInput
{
    var output: CompanyTrackViewControllerOutput!
    var router: CompanyTrackRouter!
    
    // MARK: Object lifecycle
    var viewModel = CompanyTrack.ViewModel()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        CompanyTrackConfigurator.sharedInstance.configure(viewController:self)
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
        
        let request = CompanyTrack.Request()
        output.doFetchCompanyTracks(request: request)
    }
    
    // MARK: Display logic
    
    func displayTable(viewModel: CompanyTrack.ViewModel)
    {
        // NOTE: Display the result from the Presenter
        
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}


extension CompanyTrackViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "已设置轨迹(\(self.viewModel.count ?? 0) / \(self.viewModel.total ?? 0))"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.companys?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellCompanyTrackIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        let model = self.viewModel.companys?[indexPath.row]
        let view = cell.viewWithTag(1) as? UITextField
        view?.text = model
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        output.selectedCompany = self.viewModel.companys?[indexPath.row]
        return indexPath
    }
}
