//
//  HomePageViewController.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/11.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit
import SDCycleScrollView

class HomePageViewController: UITableViewController {
    
    var tableHeadView: SDCycleScrollView!
    var ifCellRegistered = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        self.tableHeadView = SDCycleScrollView(frame: CGRect(x:0, y:0, width:self.tableView.frame.width, height:128))
//        self.tableHeadView.backgroundColor = UIColor.red
//        self.tableView.tableHeaderView = tableHeadView
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
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecruitCellIdentifier", for: indexPath)
//        cell.backgroundColor = UIColor.red
        return cell
    }

}

