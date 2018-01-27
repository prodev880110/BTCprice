//
//  AppDelegate+Setup.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Fabric
import Firebase
import Foundation

extension AppDelegate {
    
    func setupFirebase() {
        FirebaseApp.configure()
        /*
        #if DEBUG
            FirebaseConfiguration.shared.setLoggerLevel(.debug)
            Fabric.sharedSDK().debug = true
        #endif
        */
    }
    
    func setupRemoteConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
        #if DEBUG
            if let configSettings = RemoteConfigSettings(developerModeEnabled: true) {
                remoteConfig.configSettings = configSettings
            }
        #endif
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
}
