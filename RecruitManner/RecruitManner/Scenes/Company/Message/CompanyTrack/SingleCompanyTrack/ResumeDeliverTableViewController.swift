//
//  ResumeDeliverTableViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit
import CustomViews
import MJRefresh
import SDWebImage

class ResumeDeliverTableViewController: UITableViewController {
    
    static func storyboardInstance() -> ResumeDeliverTableViewController? {
        let storyboard = UIStoryboard(name: "Company", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ResumeDeliverTableViewController") as? ResumeDeliverTableViewController
    }
    
    var viewModel: [SingleCompanyTrack.ViewModel.JobSeekerItem]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayTable(viewModel: [SingleCompanyTrack.ViewModel.JobSeekerItem]?) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseResumeDeliverIdentifier", for: indexPath)

        guard let view = cell.viewWithTag(1) as? ResumeDeliverItemView else {
            return cell
        }
        
        guard let modle = viewModel?[indexPath.row] else {
            return cell
        }
        
        view.nameLabel.text = modle.name
        view.infoLabel.text = modle.info
        view.markLabel.text = modle.mark
        view.companyLabel.text = modle.company
        view.ageLimitLabel.text = modle.ageLimit
        view.deliveryTimeLabel.text = modle.deliveryTime
        
        if let urlstring = modle.logoImageUlr, let url = URL(string: urlstring) {
            view.logoImageView.sd_setImageWithPreviousCachedImage(with: url,
                                                                  placeholderImage: UIImage(named: "social_logo"),
                                                                  options: .continueInBackground,
                                                                  progress: nil,
                                                                  completed: nil)
        }
        
        if let usrstr = modle.userImageUlr, let usrUrl = URL(string: usrstr) {
            view.userImageView.sd_setImageWithPreviousCachedImage(with: usrUrl,
                                                                  placeholderImage: UIImage(named: "User"),
                                                                  options: .continueInBackground,
                                                                  progress: nil,
                                                                  completed: nil)
        }

        return cell
    }
    
}
