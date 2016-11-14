//
//  JobTableViewCell.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/11.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class JobTableViewCell: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var subDetail: UILabel!
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalFromXib()
    }
    
    func initalFromXib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "JobCellView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
    
}
