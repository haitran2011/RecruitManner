//
//  ShowUpMoreView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class ShowUpMoreView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
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
    
    @IBInspectable
    var packUp: Bool? = false {
        didSet {
            
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
        let nib = UINib(nibName: "ShowUpMoreView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

}
