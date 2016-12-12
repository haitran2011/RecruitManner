//
//  SingleCompanyTrackViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import DLSlideView
import AFImageHelper

protocol SingleCompanyTrackViewControllerInput {
    
    func displayCompanyName(viewModel: SingleCompanyTrack.ViewModel)
    
    func displaySlideTabedBar(viewModel: SingleCompanyTrack.ViewModel)
    
    func displayTable(viewModel: SingleCompanyTrack.ViewModel)
}

protocol SingleCompanyTrackViewControllerOutput {

    func doSomething(request: SingleCompanyTrack.Request)
    var selectedCompany: String? { get set }
    
    var selectedJob: Int { get set }
    var allJobs: [String]? { get }
}


// ============================================================================= //
// MARK: - SingleCompanyTrackViewController Class Definition
// ============================================================================= //
class SingleCompanyTrackViewController: UIViewController, SingleCompanyTrackViewControllerInput {

    var output: SingleCompanyTrackViewControllerOutput!
    var router: SingleCompanyTrackRouter!
    
    @IBOutlet weak var tabedSlideView: DLTabedSlideView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
  
    // MARK: Object lifecycle
  
    override func awakeFromNib() {

        super.awakeFromNib()
        SingleCompanyTrackConfigurator.sharedInstance.configure(viewController:self)
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tabedSlideView.baseViewController = self
        tabedSlideView.tabItemNormalColor = UIColor.secondayText
        tabedSlideView.tabItemSelectedColor = UIColor.darkPrimary
        tabedSlideView.tabbarTrackColor = UIColor.darkPrimary
        tabedSlideView.tabbarBackgroundImage = UIImage(named: "tabbarBk")
        tabedSlideView.tabbarBottomSpacing = 3.0
        
        doSomethingOnLoad()
    }
  
    // MARK: Event handling
    
    
    @IBAction func didTap7dayBtn(_ sender: UIButton) {

    }
    
    @IBAction func didTap1MomBtn(_ sender: UIButton) {

    }
    
    @IBAction func didTap3MomBtn(_ sender: UIButton) {

    }
  
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
    
        let request = SingleCompanyTrack.Request()
        output.doSomething(request: request)
    }
  
    // MARK: Display logic
    func displayCompanyName(viewModel: SingleCompanyTrack.ViewModel) {
        self.companyNameLabel.text = viewModel.companyName
    }
    
    func displaySlideTabedBar(viewModel: SingleCompanyTrack.ViewModel) {
        let clearImage = UIImage(color: UIColor.clear, size: CGSize(width: 17, height: 17))
        tabedSlideView.tabbarItems = viewModel.barItems?.flatMap {
            DLTabedbarItem(title: $0, image: clearImage, selectedImage: clearImage)
        }
        tabledControllers = viewModel.barItems?.flatMap { _ in
            ResumeDeliverTableViewController.storyboardInstance()
        }
        tabedSlideView.buildTabbar()
        tabedSlideView.selectedIndex = 0
    }
    
    func displayTable(viewModel: SingleCompanyTrack.ViewModel) {
        if let index = viewModel.index,
            index >= 0,
            index < tabedSlideView.tabbarItems.count {
            
            tabledControllers?[index]?.displayTable(viewModel: viewModel.jobSeekers)
        }
    }
    
    var tabledControllers: [ResumeDeliverTableViewController?]?
}


extension SingleCompanyTrackViewController: DLTabedSlideViewDelegate {
    
    func numberOfTabs(in sender: DLTabedSlideView!) -> Int {
        return sender.tabbarItems.count
    }
    
    func dlTabedSlideView(_ sender: DLTabedSlideView!, controllerAt index: Int) -> UIViewController! {
        return tabledControllers![index]
    }
    
    func dlTabedSlideView(_ sender: DLTabedSlideView!, didSelectedAt index: Int) {
        output.selectedJob = index
    }

}
