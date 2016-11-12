//
//  HeadPortraitView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class HeadPortraitView: UIView {

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
    }
    
    func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HeadPortraitView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
}
