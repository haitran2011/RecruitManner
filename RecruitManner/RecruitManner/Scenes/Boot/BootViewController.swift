//
//  BootViewController.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/1.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

class BootViewController: UIViewController {

    lazy var shareWorker: ShareWorker = {
        return  ShareWorker()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapShareBtn(_ sender: UIButton) {
        shareWorker.testShare(at: self)
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
