//
//  Coordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get set }
    func start()
}
