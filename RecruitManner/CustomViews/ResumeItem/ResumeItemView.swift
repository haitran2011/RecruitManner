//
//  ResumeItemView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class ResumeItemView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var markLabel: RollLabel!
    @IBOutlet public weak var logoView: UIImageView!
    @IBOutlet weak var postLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日 HH:mm"
        return formatter
    }()
    
    @IBInspectable
    public var date: Date? {
        get {
            return dateFormatter.date(from: dateLabel.text ?? "")
        }
        set(newValue) {
            dateLabel.text = (newValue == nil) ? dateFormatter.string(from: newValue!) : ""
        }
    }
    
    @IBInspectable
    public var nameText: String? {
        get {
            return nameLabel.text
        }
        set(newValue) {
            nameLabel.text = newValue
        }
    }
    
    @IBInspectable
    public var markText: String? {
        get {
            return markLabel.text
        }
        set(newValue) {
            markLabel.text = newValue
        }
    }
    
    @IBInspectable
    public var postText: String? {
        get {
            return postLabel.text
        }
        set(newValue) {
            postLabel.text = newValue
        }
    }
    
    @IBInspectable
    public var logoImage: UIImage? {
        get {
            return logoView.image
        }
        set(newValue) {
            logoView.image = newValue
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
        let nib = UINib(nibName: "ResumeItemView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
    
}
