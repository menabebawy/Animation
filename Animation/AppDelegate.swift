//
//  AppDelegate.swift
//  Animation
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var firstCoordinator : FirstCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        
        firstCoordinator = FirstCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        firstCoordinator?.start()
        
        window?.makeKeyAndVisible()
        return true
    }

}
