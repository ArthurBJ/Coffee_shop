//
//  SWButton.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 27.04.2024.
//

import UIKit

final class SWButton: UIButton {
    
    // MARK: - Properties
    private let touchDownAlpha: Float = 0.3
    private let touchUpAlpha: Float = 1.0
    let animateTime: TimeInterval = 0.4
    
    // MARK: - Initializers
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        layer.cornerRadius = 25
        backgroundColor = UIColor(hexString: "#342D1A")
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        self.setTitleColor(UIColor(hexString: "#F6E5D1"), for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
    }
    
    // MARK: - Private methods
    @objc private func buttonTapped() {
        UIView.animate(withDuration: animateTime) {
            self.layer.opacity = self.touchDownAlpha
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: animateTime) {
            self.layer.opacity = self.touchUpAlpha
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
