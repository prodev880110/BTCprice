//
//  RemoteConfig+Fetch.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Firebase

extension RemoteConfig {

    func fetch() {
        let expirationDuration = configSettings.isDeveloperModeEnabled ? 0 : 3600
        fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) in
            if status == .success {
                print("Config fetched!")
                self.activateFetched()
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
}
