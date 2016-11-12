//
//  ResumeAddSkillView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class ResumeAddSkillView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBInspectable
    var titleText: String? {
        get {
            return titleLabel.text
        }
        set (newValue) {
            titleLabel.text = newValue
        }
    }
    
    @IBInspectable
    var contentText: String? {
        get {
            return contentLabel.text
        }
        set (newValue) {
            contentLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
    }
    
    private func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ResumeAddSkillView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

}
