//
//  YJTRootTabBarController.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/17.
//

import UIKit
import SnapKit

class YJTRootTabBarController: YJTBaseTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        createRootViewControllers()
    }
    
    func createRootViewControllers() {
        
//        if #available(iOS 13.0, *) {
//            let tabBarAppearance = UITabBarAppearance()
//            tabBarAppearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//            tabBarAppearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//            tabBar.standardAppearance = tabBarAppearance
//        }
        
        tabBar.backgroundColor = .white

        
        let mainNavi = YJTBaseNavigationController(rootViewController: YJTHomeViewController())
        mainNavi.tabBarItem.title = "首页"
//        mainNavi.tabBarItem.image = R.image.tabBar_home()?.withRenderingMode(.alwaysOriginal)
//        mainNavi.tabBarItem.selectedImage = R.image.tabBar_home_selected()!.withRenderingMode(.alwaysOriginal)
//        mainNavi.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//        mainNavi.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        
//        let liveNavi = YJCBaseNavigationController(rootViewController: YJCLiveHomeViewController())
//        liveNavi.tabBarItem.title = "直播"
//        liveNavi.tabBarItem.image = R.image.tabBar_live()!.withRenderingMode(.alwaysOriginal)
//        liveNavi.tabBarItem.selectedImage = R.image.tabBar_live_selected()!.withRenderingMode(.alwaysOriginal)
//        liveNavi.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//        liveNavi.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
//        
//        let foundNavi = YJCBaseNavigationController(rootViewController: YJCFoundHomeViewController())
//        foundNavi.tabBarItem.title = "发现"
//        foundNavi.tabBarItem.image = R.image.tabBar_found()!.withRenderingMode(.alwaysOriginal)
//        foundNavi.tabBarItem.selectedImage = R.image.tabBar_found_selected()!.withRenderingMode(.alwaysOriginal)
//        foundNavi.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//        foundNavi.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
//        
        let mineNavi = YJTBaseNavigationController(rootViewController: YJTMineHomeViewController())
        mineNavi.tabBarItem.title = "我的"
//        userCenterNavi.tabBarItem.image = R.image.tabBar_person()!.withRenderingMode(.alwaysOriginal)
//        userCenterNavi.tabBarItem.selectedImage = R.image.tabBar_person_selected()!.withRenderingMode(.alwaysOriginal)
//        userCenterNavi.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
//        userCenterNavi.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        
//        viewControllers = [mainNavi, liveNavi, foundNavi, userCenterNavi]
        viewControllers = [mainNavi, mineNavi]
    }
    

}

extension YJTRootTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
//        if viewController != tabBarController.selectedViewController, let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
//            let tabBarButton = tabBarController.tabBar.subviews.filter{ $0.isKind(of:UIControl.self)}
//            let control = tabBarButton[index]
//            tapedAnimate(view: control)
//        }
        return true
    }
    
    private func tapedAnimate(view: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        let angle = .pi/18.0
        animation.values = [-angle, angle, -angle/2, angle/2,];
        animation.duration = 0.3
        view.layer.add(animation, forKey: nil)
    }
    
}
