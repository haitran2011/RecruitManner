//
//  RollLabel.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class RollLabel: UIView {
    
    var scrollView: UIScrollView!
    var label: UILabel!
    
    @IBInspectable
    var text: String? {
        get {
            return self.label.text
        }
        set(newValue) {
            self.label.text = newValue
            label.sizeToFit()
            scrollView.contentSize = label.frame.size
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.text = "xxxxxxrrrrrrrrrrrrrrrrrrrrrrrrrrbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbvvvvvv"
        label.sizeToFit()
        scrollView.contentSize = label.frame.size
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        scrollView.addSubview(label)
        self.addSubview(scrollView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.frame = self.bounds
    }

}
