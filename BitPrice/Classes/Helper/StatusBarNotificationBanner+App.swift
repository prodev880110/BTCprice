//
//  StatusBarNotificationBanner+App.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import NotificationBannerSwift

extension StatusBarNotificationBanner {

    class var noConnection: StatusBarNotificationBanner {
        let title = "banner.no_connection".localized
        return StatusBarNotificationBanner(title: title, style: .info, colors: BannerColors())
    }

    class var serverFailure: StatusBarNotificationBanner {
        let title = "banner.server_failure".localized
        return StatusBarNotificationBanner(title: title, style: .danger, colors: BannerColors())
    }

}
