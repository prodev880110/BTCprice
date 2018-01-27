//
//  HeaderView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Variable
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK: - Action
    
    @IBAction func refreshSelect(_ sender: UIButton) {
        delegate?.headerViewRefreshDidSelect()
    }

}

protocol HeaderViewDelegate: class {
    func headerViewRefreshDidSelect()
}
