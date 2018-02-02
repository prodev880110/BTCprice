//
//  HeaderView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Variable
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "body_price_view.title".localized
    }
    
    // MARK: - Action
    
    @IBAction func refreshSelect(_ sender: UIButton) {
        delegate?.headerViewRefreshDidSelect()
    }

}

protocol HeaderViewDelegate: class {
    func headerViewRefreshDidSelect()
}
