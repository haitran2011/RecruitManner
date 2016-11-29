//
//  JobTableViewSessionHeader.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/14.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class JobTableViewSessionHeader: UIView {

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var headTitleLable: UILabel!
    
    public var title:String? {
        didSet(newVal) {
            self.headTitleLable.text = title
        }
    }
    
    public var image:UIImage? {
        didSet {
            self.headImageView.image = image
        }
    }
    
    public var hideImageView = false {
        didSet {
            self.headImageView.isHidden = hideImageView
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
        let nib = UINib(nibName: "JobTableViewSessionHeader", bundle: bundle)
        view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    public func setTitle(title:String?) {
        self.title = title
    }
    
    public func setImage(image:UIImage?) {
        self.image = image
    }
    
//    override public var contentView: UIView {
//        get {
//            return self.view
//        }
//    }
    
    

}
