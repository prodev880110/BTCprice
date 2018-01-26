//
//  CardView.swift
//  Comanda
//
//  Created by Bruno Tortato Furtado on 07/01/18.
//  Copyright © 2018 Qoode. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.125
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 0.5
    }

}
