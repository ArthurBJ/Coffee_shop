//
//  SWTextField.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 27.04.2024.
//

import UIKit

final class SWTextField: UITextField {
    
    // MARK: - Properties
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    // MARK: - Initizlizers
    init(placeholder: String) {
        super.init(frame: .zero)
        layer.cornerRadius = 25.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(hexString: "#846340").cgColor
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AF9479")]
        )
        font = .systemFont(ofSize: 18, weight: .light)
        heightAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override method
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
