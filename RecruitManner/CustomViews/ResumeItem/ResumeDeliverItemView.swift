//
//  ResumeDeliverItemView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class ResumeDeliverItemView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet public weak var nameLabel: UILabel!
    @IBOutlet public weak var userImageView: UIImageView!
    @IBOutlet public weak var infoLabel: UILabel!
    @IBOutlet public weak var markLabel: RollLabel!
    @IBOutlet public weak var companyLabel: UILabel!
    @IBOutlet public weak var ageLimitLabel: UILabel!
    @IBOutlet public weak var deliveryTimeLabel: UILabel!
    @IBOutlet public weak var logoImageView: UIImageView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initalFromXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalFromXib()
    }
    
    func initalFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ResumeDeliverItemView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

}
