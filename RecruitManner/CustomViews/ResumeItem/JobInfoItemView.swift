//
//  JobInfoItemView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class JobInfoItemView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    
    public var isHiddenDate: Bool {
        get {
            return dayLabel.isHidden
        }
        set(newValue) {
            dayLabel.isHidden = newValue
            monthLabel.isHidden = newValue
        }
    }
    
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
        let nib = UINib(nibName: "JobInfoItemView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

}
