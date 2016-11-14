//
//  JobDetailTableViewController.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/14.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

class JobDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let nib = UINib(nibName: "JobTableViewCellHeader", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: "JobDetailHeaderIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var rowNumber = 0
        if section < 4 {
            rowNumber = 1
        }
        else {
            rowNumber = 3
        }
        
        return rowNumber
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = tableView.dequeueReusableCell(withIdentifier: "JobDetailHeaderIdentifier")
        
        if headView == nil {
            print("headView is nil")
            
        }
        headView?.backgroundColor = UIColor.white
        return headView
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        var cell:UITableViewCell? = nil
        
        switch indexPath.section
        {

        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "JobNameIdentifier")
            break
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "JobDescribtionIdentifier")
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "JobAddressIdentifier")
            break
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "JobReleaseIdentifier")
            break
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "AppraisalIdentifier")
            break
//        case 5:
//            cell = tableView.dequeueReusableCell(withIdentifier: "AppraisalIdentifier")
//            break
        default:
            return cell!
        }
        

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHeiht:CGFloat = 44.0
        
        switch indexPath.section {
        case 0:
            rowHeiht = 160.0
        case 1:
            rowHeiht = 300.0
        case 2:
            rowHeiht = 44.0
        case 3:
            rowHeiht = 100.0
        case 4:
            rowHeiht = 120.0
        default: break
            
        }
        return rowHeiht
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
