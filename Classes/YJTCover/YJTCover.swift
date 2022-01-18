//
//  YJTCover.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/14.
//

import UIKit


///弹窗背景蒙版样式
enum YJTCoverMaskStyle{
    
    case none
    case color(_ color: UIColor)
    case blur
    
    static func ==(a: YJTCoverMaskStyle, b: YJTCoverMaskStyle) -> Bool {
        switch (a, b) {
        case (.none, .none),
            (.color, .color),
            (.blur, .blur):
            return true
        default:
            return false
        }
    }
}

///内容视图显示在弹窗中的位置
enum YJTCoverPosition {
    case center
    case top
    case left
    case right
    case bottom
}


class YJTCover: NSObject {
    
    ///所有显示的弹窗
    private static var coverList = [YJTCoverView]()
    
    static var animateDuration = 0.25
    
    /// 显示弹窗
    /// - Parameters:
    ///   - contentView: 显示的内容视图对象
    ///   - anchorView: 显示在哪个视图
    ///   - position: 内容视图显示在父视图位置
    ///   - maskStyp: 背景蒙版样式
    ///   - hideOnTouchOut: 点击内容视图外是否自动隐藏
    class func showCover(_ contentView: UIView, anchorView: UIView = YJTCover.keyWindow!, position: YJTCoverPosition = .center, maskStyle: YJTCoverMaskStyle = .none, hideOnTouchOut: Bool = true, animate: Bool = true) {
        //创建弹窗视图
        let coverView = YJTCoverView(frame: anchorView.bounds)
        coverView.position = position
        coverView.maskStyle = maskStyle
        coverView.hideOnTouchOut = hideOnTouchOut
        coverView.contentView = contentView
        
        //如果和上一个弹窗在同一个父视图，隐藏之前的蒙版
        let lastCoverView = coverList.last
        if let lastCoverView = lastCoverView, lastCoverView.superview == anchorView, lastCoverView.maskStyle == maskStyle {
            lastCoverView.hideMaskStyle(animate)
        }
        
        //显示当前弹窗
        anchorView.addSubview(coverView)
        coverView.showAnimation(animate)
        coverList.append(coverView)
    }
    
    /// 隐藏最后显示的弹窗
    class func hide(animate: Bool = true) {
        //移除最新的弹窗
        let coverView = coverList.last
        coverList.removeLast()
        
        //筛选剩下的具有相同父视图的弹窗，显示最后一个的蒙版
        let lastCoverView = coverList.filter{ $0.superview == coverView?.superview}.last
        lastCoverView?.showMaskStyle(animate)
        
        //隐藏弹窗
        coverView?.hideAnimation(animate)
    }
    
    ///隐藏所有弹窗
    class func hideAll(animate: Bool = true) {
        for coverView in coverList {
            coverView.hideAnimation(animate)
        }
        coverList.removeAll()
    }
    
    
    /// 隐藏指定内容视图弹窗
    /// - Parameter contentView: 内容视图对象
    class func hideContentView(_ contentView: UIView, animate: Bool = true) {
        //根据内容视图找到指定弹窗
        let coverView = coverList.filter{ $0.subviews.contains(contentView)}.first
        
        if let coverView = coverView {
            //筛选与指定弹窗相同父视图的弹窗
            let sameSuperList = coverList.filter{ $0.superview == coverView.superview}
            //如果指定弹窗在相同父视图弹窗数组中是最后一个，且有前一个，显示前一个弹窗的蒙版
            if let index = sameSuperList.firstIndex(of: coverView), index == sameSuperList.endIndex, index > sameSuperList.startIndex {
                let lastSameSuperCoverView = sameSuperList[sameSuperList.index(before: index)]
                lastSameSuperCoverView.showMaskStyle(animate)
            }
        }
        //隐藏指定弹窗
        coverView?.hideAnimation(animate)
        coverList.removeAll(where: {$0 == coverView})
    }
    
}

fileprivate extension YJTCover {
    
    class var keyWindow: UIWindow? {
        var window: UIWindow?
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.connectedScenes.filter {$0.activationState == .foregroundActive}.compactMap {$0 as? UIWindowScene}.first?.windows.filter{$0.isKeyWindow}.first
        }
        
        if (window == nil){
            window = UIApplication.shared.keyWindow
        }
        return window
    }
}



fileprivate class YJTCoverView: UIView {
    
    var contentView: UIView?
    
    var maskStyle: YJTCoverMaskStyle = .none
    var position: YJTCoverPosition = .center
    var hideOnTouchOut: Bool = true
    
    private var startTransform: CGAffineTransform = .identity
    private var effectView: UIVisualEffectView?
    
    deinit {
        print(type(of: self), #line, #function)
    }
    
    func showAnimation(_ animate: Bool = true) {
        if let contentView = contentView {
            //蒙版样式
            switch maskStyle {
            case .none:
                backgroundColor = .clear
            case .color(let color):
                backgroundColor = color
            case .blur:
                effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
                effectView?.frame = bounds
                addSubview(effectView!)
            }
            
            //内容视图位置
            addSubview(contentView)
            switch position {
            case .center:
//                contentView.center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
                contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            case .top:
//                var frame = contentView.frame
//                frame.origin.y = 0
//                contentView.frame = frame
                contentView.transform = CGAffineTransform(translationX: 0, y: -contentView.frame.maxY)
            case .left:
//                var frame = contentView.frame
//                frame.origin.x = 0
//                contentView.frame = frame
                contentView.transform = CGAffineTransform(translationX: -contentView.frame.maxX, y: 0)
            case .right:
//                var frame = contentView.frame
//                frame.origin.x = bounds.width - frame.width
//                contentView.frame = frame
                contentView.transform = CGAffineTransform(translationX: frame.width - contentView.frame.minX, y: 0)
            case .bottom:
//                var frame = contentView.frame
//                frame.origin.y = bounds.height - frame.height
//                contentView.frame = frame
                contentView.transform = CGAffineTransform(translationX: 0, y: frame.height - contentView.frame.minY)
            }
            
            //显示动画
            startTransform = contentView.transform
            alpha = 0
            UIView.animate(withDuration: animate ? YJTCover.animateDuration : 0.001, delay: 0, options: .curveEaseInOut) {
                contentView.transform = .identity
                self.alpha = 1
            } completion: { complete in
                
            }
        }
    }
    
    func hideAnimation(_ animate: Bool = true) {
        UIView.animate(withDuration: animate ? YJTCover.animateDuration : 0.001, delay: 0, options: .curveEaseInOut) {
            self.contentView?.transform = self.startTransform
            self.alpha = 0
        } completion: { complete in
            self.removeFromSuperview()
        }
    }
    
    func hideMaskStyle(_ animate: Bool = true) {
        UIView.animate(withDuration: animate ? YJTCover.animateDuration : 0.001, delay: 0, options: .curveEaseInOut) {
            self.backgroundColor = .clear
            self.effectView?.alpha = 0;
        } completion: { complete in
            
        }
    }
    
    func showMaskStyle(_ animate: Bool = true) {
        UIView.animate(withDuration: animate ? YJTCover.animateDuration : 0.001, delay: 0, options: .curveEaseInOut) {
            switch self.maskStyle {
            case .none:
                self.backgroundColor = .clear
            case .color(let color):
                self.backgroundColor = color
            case .blur:
                self.effectView?.alpha = 1
            }
        } completion: { complete in
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if hideOnTouchOut {
            let touch = touches.first
            let point = touch?.location(in: self)
            if let point = point, let contains = contentView?.frame.contains(point) {
                if !contains {
                    YJTCover.hide()
                }
            }
        }
    }
}
