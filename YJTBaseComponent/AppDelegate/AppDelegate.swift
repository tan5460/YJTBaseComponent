//
//  AppDelegate.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = YJTRootTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

    


}

