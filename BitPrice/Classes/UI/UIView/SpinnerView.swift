//
//  SpinnerView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class SpinnerView: UIView {
    
    private let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    func show(onView: UIView) {
        backgroundColor = onView.backgroundColor
        
        frame = onView.frame
        frame.origin.x = 0
        frame.origin.y = 0

        indicatorView.startAnimating()
        indicatorView.center = center
        
        self.addSubview(self.indicatorView)
        onView.addSubview(self)
    }
    
    func hide() {
        self.indicatorView.stopAnimating()
        self.removeFromSuperview()
    }
    
}
