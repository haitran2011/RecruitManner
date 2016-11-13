//
//  OnlineResumeViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/13.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol OnlineResumeViewControllerInput {
    
    func displaySomething(viewModel: OnlineResume.ViewModel)
}

protocol OnlineResumeViewControllerOutput {
    
    func doSomething(request: OnlineResume.Request)
}


// ============================================================================= //
// MARK: - OnlineResumeViewController Class Definition
// ============================================================================= //
class OnlineResumeViewController: UIViewController, OnlineResumeViewControllerInput {
    
    var output: OnlineResumeViewControllerOutput!
    var router: OnlineResumeRouter!
    
    @IBOutlet weak var tableView: UITableView!
  
    // MARK: Object lifecycle
  
    override func awakeFromNib() {
        super.awakeFromNib()
        OnlineResumeConfigurator.sharedInstance.configure(viewController:self)
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewHead()
        
        doSomethingOnLoad()
    }
  
    // MARK: Event handling
  
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
    
        let request = OnlineResume.Request()
        output.doSomething(request: request)
    }
  
    // MARK: Display logic
  
    func displaySomething(viewModel: OnlineResume.ViewModel) {
        // NOTE: Display the result from the Presenter
    
        // nameTextField.text = viewModel.name
    }
}

fileprivate let ConstCellAddHeadPortraitIdentifier = 0
fileprivate let ConstCellBasicInfoIdentifier = 1
fileprivate let CellOccupationalHistoryIdentifier = 2
fileprivate let ConstCellEducationHistoryIdentifier = 3
fileprivate let ConstCellEexpectationsJobIdentifier = 4
fileprivate let ConstCellAddSkillIdentifier = 5
fileprivate let ConstCellAddSelfDescriptionIdentifier = 6
fileprivate let ConstCellShowUpMoreIdentifier = 7
fileprivate let ConstCell_NL = 8

extension OnlineResumeViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setTableViewHead() {
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44)
        let headerButton = UIButton(frame: rect)
        headerButton.setTitle("用电脑编辑简历，体验更好更流畅", for: .normal)
        headerButton.setTitleColor(UIColor.white, for: .normal)
        headerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        headerButton.backgroundColor = UIColor.blue
        tableView.tableHeaderView = headerButton
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConstCell_NL
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case ConstCellAddHeadPortraitIdentifier:
            return 66
        case ConstCellBasicInfoIdentifier:
            return 240
        case CellOccupationalHistoryIdentifier, ConstCellEducationHistoryIdentifier:
            return 106
        case ConstCellEexpectationsJobIdentifier:
            return 66
        case ConstCellAddSkillIdentifier, ConstCellAddSelfDescriptionIdentifier, ConstCellShowUpMoreIdentifier:
            return 88
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == ConstCellAddHeadPortraitIdentifier {
            return "添加头像"
        }
        
        if section == ConstCellBasicInfoIdentifier {
            return "基本信息（必填）"
        }
        
        if section == CellOccupationalHistoryIdentifier {
            return "工作经历（必填）"
        }
        
        if section == ConstCellEducationHistoryIdentifier {
            return "教育经理（必填）"
        }
        
        if section == ConstCellEexpectationsJobIdentifier {
            return "期望工作（必填）"
        }
        
        if section == ConstCellAddSkillIdentifier {
            return "技能评价"
        }
        
        if section == ConstCellAddSelfDescriptionIdentifier {
            return "自我描述"
        }
        
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == ConstCellAddHeadPortraitIdentifier {
            return cellAddHeadPortraitView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellBasicInfoIdentifier {
            return cellBasicInfoView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == CellOccupationalHistoryIdentifier {
            return cellOccupationalHistoryView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellEducationHistoryIdentifier {
            return cellEducationHistoryView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellEexpectationsJobIdentifier {
            return cellEexpectationsJobView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellAddSkillIdentifier {
            return cellAddSkillView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellAddSelfDescriptionIdentifier {
            return cellAddSelfDescriptionView(tableView, cellForRowAt: indexPath)
        }
        
        if indexPath.section == ConstCellShowUpMoreIdentifier {
            return cellShowUpMoreView(tableView, cellForRowAt: indexPath)
        }
        
        return UITableViewCell()
    }
    
    
    private func cellAddHeadPortraitView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellAddHeadPortraitIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    func cellBasicInfoView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellBasicInfoIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellOccupationalHistoryView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellOccupationalHistoryIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellEducationHistoryView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellEducationHistoryIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellEexpectationsJobView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellEexpectationsJobIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellAddSkillView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellAddSkillIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellAddSelfDescriptionView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellAddSelfDescriptionIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
    private func cellShowUpMoreView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Identifier = "CellShowUpMoreIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath)
        
        return cell
    }
    
}

