//
//  UINavigationController + Extension.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        addBottomLine()
        updateUI()
    }
    
    private func addBottomLine() {
        let firstLine = UIView()
        firstLine.backgroundColor = UIColor(hexString: "#C2C2C2")
        firstLine.translatesAutoresizingMaskIntoConstraints = false
        
        let secondLine = UIView()
        secondLine.backgroundColor = UIColor(hexString: "#C2C2C2")
        secondLine.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(firstLine)
        navigationBar.addSubview(secondLine)
        NSLayoutConstraint.activate([
            firstLine.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 1),
            firstLine.widthAnchor.constraint(equalTo: navigationBar.widthAnchor),
            firstLine.heightAnchor.constraint(equalToConstant: 1),
            
            secondLine.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 1),
            secondLine.widthAnchor.constraint(equalTo: navigationBar.widthAnchor),
            secondLine.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func updateUI() {
        navigationBar.tintColor = UIColor(hexString: "#846340")
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(hexString: "#846340"),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
    }
}
