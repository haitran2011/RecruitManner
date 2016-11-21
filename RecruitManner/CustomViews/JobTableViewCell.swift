//
//  JobTableViewCell.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/11.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class JobTableViewCell: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var subDetail: UILabel!
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    
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
        let nib = UINib(nibName: "JobTableViewCell", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    @IBInspectable
    public var logoImage:UIImage? {
        didSet {
            self.logo.image = logoImage
        }
    }
    
    @IBInspectable
    public var titleName:String? {
        didSet {
            self.title.text = titleName
        }
    }
    
    @IBInspectable
    public var subTitleName:String? {
        didSet {
            self.subTitle.text = subTitleName
        }
    }
    
    @IBInspectable
    public var detailName:String? {
        didSet {
            self.detail.text = detailName
        }
    }
    
    @IBInspectable
    public var numberName:String? {
        didSet {
            self.number.text = numberName
        }
    }

    @IBInspectable
    public var subDetailName:String? {
        didSet {
            self.subDetail.text = subDetailName
        }
    }

    @IBInspectable
    public var dateName:String? {
        didSet {
            self.dateLable.text = dateName
        }
    }

}
