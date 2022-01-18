//
//  YJTAppUniversal.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/17.
//

import Foundation
import UIKit

//MARK: - UI



let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let kWidthScale = (kScreenWidth/375.0)
let kHeightScale = (kScreenHeight/667.0)

let kIPhoneX = (kScreenHeight > 812)

let kStatusBarHeight = (kIPhoneX ? 44: 20)
let kNaviBarHeight = kStatusBarHeight + 44
let kTabBarHeight = CGFloat(kIPhoneX ? 83.0 : 49.0)

let kBottomSafeHeight = CGFloat(kIPhoneX ? 34.0 : 0.0)



//MARK: - UIColor

func hexColor(_ hexNum: NSInteger, alpha: CGFloat = 1) -> UIColor {
    let r = CGFloat(hexNum >> 16)
    let g = CGFloat(hexNum >> 8 & 0xFF)
    let b = CGFloat(hexNum & 0xFF)
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha);
}

func randomColor(_ alpha: CGFloat = 1) -> UIColor {
    let r = CGFloat(arc4random()%256)/255
    let g = CGFloat(arc4random()%256)/255
    let b = CGFloat(arc4random()%256)/255
    return UIColor(red: r, green: g, blue: b, alpha: alpha)
}
