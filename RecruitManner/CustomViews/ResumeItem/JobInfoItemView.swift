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
    
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var markLabel: RollLabel!
    
    @IBInspectable
    public var isHiddenDate: Bool {
        get {
            return dayLabel.isHidden
        }
        set(newValue) {
            dayLabel.isHidden = newValue
            monthLabel.isHidden = newValue
        }
    }
    
    @IBInspectable
    public var dayText: String? {
        get {
            return self.dayLabel.text
        }
        set(newValue) {
            self.dayLabel.text = newValue
        }
    }
    
    public var day: Int = 0 {
        didSet(newValue) {
            self.dayLabel.text = String(format: "%02d日", newValue)
        }
    }
    
    @IBInspectable
    public var monthText: String? {
        get {
            return self.monthLabel.text
        }
        set(newValue) {
            self.monthLabel.text = newValue
        }
    }
    
    public var month: Int = 0 {
        didSet(newValue) {
            self.monthLabel.text = String(format: "%02d月", newValue)
        }
    }
    
    @IBInspectable
    public var titileText: String? {
        get {
            return self.titileLabel.text
        }
        set(newValue) {
            self.titileLabel.text = newValue
        }
    }
    
    @IBInspectable
    public var summaryText: String? {
        get {
            return self.summaryLabel.text
        }
        set(newValue) {
            self.summaryLabel.text = newValue
        }
    }
    
    @IBInspectable
    public var markText: String? {
        get {
            return self.markLabel.text
        }
        set(newValue) {
            self.markLabel.text = newValue
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
