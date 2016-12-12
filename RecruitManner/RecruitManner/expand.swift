//
//  expand.swift
//  KidsWatchVariant
//
//  Created by Jiang Duan on 16/12/6.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import UIKit

func i18n(_ key: String) -> String {
    return NSLocalizedString(key, comment: key)
}

func with<T>(_ host: T, closure: (T)->Void) {
    closure(host)
}

func with<T>(o host: Optional<T>, closure: (T)->Void) {
    guard let _host = host else {
        return
    }
    closure(_host)
}

func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Int {
    return (blue | (green << 8) | (red << 16) | (0xFF << 24))
}

func argb(_ alpha: Int, _ red: Int, _ green: Int, _ blue: Int) -> Int {
    return (blue | (green << 8) | (red << 16) | (alpha << 24))
}

extension UIColor {

    // ARGB
    convenience init(argb: Int) {
        let blue    = (CGFloat)((argb >>  0) & 0xFF) / 255.0
        let green   = (CGFloat)((argb >>  8) & 0xFF) / 255.0
        let red     = (CGFloat)((argb >> 16) & 0xFF) / 255.0
        let alpha   = (CGFloat)((argb >> 24) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // RGB
    convenience init(rgb: Int) {
        let blue    = (CGFloat)((rgb >>  0) & 0xFF) / 255.0
        let green   = (CGFloat)((rgb >>  8) & 0xFF) / 255.0
        let red     = (CGFloat)((rgb >> 16) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class var primary: UIColor {
        get { return UIColor(rgb: 0xfadc40) }
    }
    
    class var darkPrimary: UIColor {
        get { return UIColor(rgb: 0xfbc02d) }
    }
    
    class var lightPrimary: UIColor {
        get { return UIColor(rgb: 0xfff9c4) }
    }
    
    class var accent: UIColor {
        get { return UIColor(rgb: 0x03a9f4) }
    }
    
    class var icons: UIColor {
       get { return UIColor(rgb: 0x212121) }
    }
    
    class var primaryText: UIColor {
        get { return UIColor(rgb: 0x212121) }
    }
    
    class var secondayText: UIColor {
        get { return UIColor(rgb: 0x757575) }
    }
    
    class var divider: UIColor {
        get { return UIColor(rgb: 0xbdbdbd) }
    }
}
