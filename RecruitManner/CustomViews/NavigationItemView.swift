//
//  NavigationItemView.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/21.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

@IBDesignable
public class NavigationItemView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var cityAllowImageView: UIImageView!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var searchJobBar: UISearchBar!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBAction func cancelClickAction(_ sender: UIButton) {
        self.delegate?.CancelButtonAction?()
        self.cancelBlock?(sender)
    }

    @IBAction func cityButtonClickAction(_ sender: UIButton) {
        
        self.delegate?.cityButtonAction?()
        self.cityButtonBlock?(sender)
    }
    
    @IBInspectable
    public var delegate: NavigationItemViewDelegate?
    var cancelBlock: ((_ sender: UIButton) -> Void)?
    var cityButtonBlock: ((_ sender: UIButton) -> Void)?
    var navigationSearchBarBlock: ((_ searchBar: UISearchBar) -> Void)?
    
    @IBInspectable
    public var cityTitle: String? {
        didSet {
            self.cityLabel.text = cityTitle
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initalFromXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initalFromXib()
    }
    
    func initalFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NavigationItemView", bundle: bundle)
        
        self.contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.contentView.frame = self.bounds
        addSubview(self.contentView)
        
    }
}

extension NavigationItemView: UISearchBarDelegate {
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.delegate?.NavigationSearchBarButtonClicked?(searchBar)
        self.navigationSearchBarBlock?(searchBar)
        return false
    }
}


@objc public protocol NavigationItemViewDelegate {
    @objc optional func cityButtonAction()
    @objc optional func CancelButtonAction()
    @objc optional func NavigationSearchBarButtonClicked(_ searchBar: UISearchBar)
}
