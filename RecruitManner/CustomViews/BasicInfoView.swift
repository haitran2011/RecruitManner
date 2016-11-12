//
//  BasicInfoView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class BasicInfoView: UIView {

    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var degreeLable: UILabel!
    @IBOutlet weak var ageLimitLabel: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBInspectable
    var nameText: String? {
        get {
            return nameLable.text
        }
        set (newValue) {
            nameLable.text = newValue
        }
    }
    
    @IBInspectable
    var genderText: String? {
        get {
            return genderLabel.text
        }
        set (newValue) {
            genderLabel.text = newValue
        }
    }
    
    @IBInspectable
    var degreeText: String? {
        get {
            return degreeLable.text
        }
        set (newValue) {
            degreeLable.text = newValue
        }
    }
    
    @IBInspectable
    var ageLimitText: String? {
        get {
            return ageLimitLabel.text
        }
        set (newValue) {
            ageLimitLabel.text = newValue
        }
    }
    
    @IBInspectable
    var cityText: String? {
        get {
            return cityLable.text
        }
        set (newValue) {
            cityLable.text = newValue
        }
    }
    
    @IBInspectable
    var phoneText: String? {
        get {
            return phoneLabel.text
        }
        set (newValue) {
            phoneLabel.text = newValue
        }
    }
    
    @IBInspectable
    var emailText: String? {
        get {
            return emailLable.text
        }
        set (newValue) {
            emailLable.text = newValue
        }
    }
    
    @IBInspectable
    var introduceText: String? {
        get {
            return introduceLabel.text
        }
        set (newValue) {
            introduceLabel.text = newValue
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
        let nib = UINib(nibName: "BasicInfoView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

}
