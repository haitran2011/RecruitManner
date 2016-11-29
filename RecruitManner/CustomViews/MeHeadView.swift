//
//  MeHeadView.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/12.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
class MeHeadView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    @IBOutlet weak var modifyButton: UIButton!
    
    var delegate: MeHeadViewDelegate?
    
    @IBInspectable
    var imageHead: UIImage? {
        didSet {
            headImage.image = imageHead
        }
    }
    
    @IBInspectable
    var name: String? {
        didSet {
            nameLable.text = name
        }
    }
    
    @IBInspectable
    var desc: String? {
        didSet {
            descriptionLable.text = desc
        }
    }
    
    @IBInspectable
    var hiddenEdit: Bool = false {
        didSet {
            self.modifyButton.isHidden = hiddenEdit
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
    
    func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MeHeadView", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }

    @IBAction func editAction(_ sender: UIButton) {
        delegate?.editAction?()
    }
}


@objc protocol MeHeadViewDelegate {
    
    @objc optional func editAction()
}
