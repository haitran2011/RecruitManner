//
//  JobTableViewCell.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/11.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

//@IBDesignable
class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var subDetail: UILabel!
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //initalFromXib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initalFromXib() {
        Bundle.main.loadNibNamed("JobTableViewCell", owner: nil, options: nil)
        
    }
    
}
