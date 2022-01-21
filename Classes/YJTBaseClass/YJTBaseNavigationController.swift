//
//  YJTBaseNavigationController.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/17.
//

import UIKit

open class YJTBaseNavigationController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    

}
