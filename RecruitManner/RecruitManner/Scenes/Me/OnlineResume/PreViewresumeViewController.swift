//
//  PreViewresumeViewController.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/28.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit
import CustomViews

class PreViewresumeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PreViewresumeViewController:UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNumber = 0
        switch section {
        case 0:
            rowNumber = 1
        case 1:
            rowNumber = 3
        case 2:
            rowNumber = 1
        case 3:
            rowNumber = 1
        case 4:
            rowNumber = 1
        case 5:
            rowNumber = 1
        case 6:
            rowNumber = 1
        default:
            rowNumber = 0
        }
        return rowNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = nil
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "CellBasicInfoIdentifier", for: indexPath)
        case 1:
             cell = tableView.dequeueReusableCell(withIdentifier: "CellOccupationalHistoryIdentifier", for: indexPath)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "CellEducationHistoryIdentifier", for: indexPath)
        case 3:
             cell = tableView.dequeueReusableCell(withIdentifier: "CellEexpectationsJobIdentifier", for: indexPath)
        case 4:
             cell = tableView.dequeueReusableCell(withIdentifier: "CellAddSkillIdentifier", for: indexPath)
        case 5:
             cell = tableView.dequeueReusableCell(withIdentifier: "CellAddSelfDescriptionIdentifier", for: indexPath)
        case 6:
             cell = tableView.dequeueReusableCell(withIdentifier: "CellShowUpMoreIdentifier", for: indexPath)
        default:
             break
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {

        case 0:
            return 240
        case 1, 2:
            return 106
        case 3:
            return 66
        case 4, 5, 6:
            return 88
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        if headView == nil {
            headView = UITableViewHeaderFooterView(reuseIdentifier: "header")
        }
        headView?.textLabel?.font = UIFont.systemFont(ofSize: 13)
        headView?.contentView.backgroundColor = UIColor.white
        switch section {
        case 0:
            headView?.textLabel?.text = "基本信息"
        case 1:
            headView?.textLabel?.text = "工作经历"
        case 2:
            headView?.textLabel?.text = "教育经理"
        case 3:
            headView?.textLabel?.text = "期望工作"
        case 4:
           headView?.textLabel?.text = "技能评价"
        case 5:
            headView?.textLabel?.text = "自我描述"
        case 6:
            headView?.textLabel?.text = "其他技能"
        default:
            headView?.textLabel?.text = ""
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}
