//
//  Button.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class Button: UIButton {

    // MARK: - Variable

    override var isHighlighted: Bool {
        didSet {
            let alpha: CGFloat = isHighlighted ? 0.25 : 1
            backgroundColor = backgroundColor?.withAlphaComponent(alpha)
        }
    }

    override var isSelected: Bool {
        didSet {
            let color: UIColor

            if isSelected {
                color = UIColor.App.purple
            } else {
                color = UIColor.App.white
            }

            backgroundColor = color
        }
    }

    // MARK: - UIButton

    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
    }

}
