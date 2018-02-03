//
//  BannerColors.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import NotificationBannerSwift

class BannerColors: BannerColorsProtocol {

    func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger:
            return UIColor.App.red
        default:
            return UIColor.App.purple
        }
    }

}
