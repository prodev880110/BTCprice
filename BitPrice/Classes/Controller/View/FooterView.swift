//
//  FooterView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var dayButton: Button!
    @IBOutlet private weak var monthButton: Button!
    @IBOutlet private weak var yearButton: Button!
    @IBOutlet private weak var allButton: Button!
    
    // MARK: - Variables
    
    weak var delegate: FooterViewDelegate?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unselectAll()
        dayButton.setTitle(ReferenceType.day.rawValue.localized, for: .normal)
        monthButton.setTitle(ReferenceType.month.rawValue.localized, for: .normal)
        yearButton.setTitle(ReferenceType.year.rawValue.localized, for: .normal)
        allButton.setTitle(ReferenceType.all.rawValue.localized, for: .normal)
    }
    
    // MARK: - Public
    
    func setReference(_ type: ReferenceType) {
        unselectAll()
        let button: Button
        
        switch type {
        case .day:
            button = dayButton
        case .month:
            button = monthButton
        case .year:
            button = yearButton
        case .all:
            button = allButton
        }
        
        button.isSelected = true
    }
    
    // MARK: - Action
    
    @IBAction func buttonSelect(_ sender: Button) {
        unselectAll()
        sender.isSelected = true
        let type: ReferenceType
        
        if sender == dayButton {
            type = .day
        } else if sender == monthButton {
            type = .month
        } else if sender == yearButton {
            type = .year
        } else {
            type = .all
        }
        
        delegate?.footerViewButtonDidSelect(type: type)
    }
    
    // MARK: - Private
    
    private func unselectAll() {
        dayButton.isSelected = false
        monthButton.isSelected = false
        yearButton.isSelected = false
        allButton.isSelected = false
    }
    
}

protocol FooterViewDelegate: class {
    func footerViewButtonDidSelect(type: ReferenceType)
}
