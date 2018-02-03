//
//  AppDelegate.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        setupRemoteConfig()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        RemoteConfig.remoteConfig().fetch()
    }

}
