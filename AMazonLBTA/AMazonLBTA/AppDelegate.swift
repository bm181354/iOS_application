//
//  AppDelegate.swift
//  AMazonLBTA
//
//  Created by Biken maharjan on 7/13/17.
//  Copyright © 2017 Biken Maharjan. All rights reserved.
//

import UIKit

class LightStatusBarNavController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
        // UINav and it encapsulate tableView
        window?.rootViewController = UINavigationController(rootViewController:ViewController())
        
        return true
    }



}

