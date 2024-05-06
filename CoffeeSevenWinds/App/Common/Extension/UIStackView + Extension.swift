//
//  UIStackView + Extension.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 27.04.2024.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
    }
}
