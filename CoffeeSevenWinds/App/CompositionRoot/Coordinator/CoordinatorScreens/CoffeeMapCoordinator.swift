//
//  CoffeeMapCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 05.05.2024.
//

import UIKit

final class CoffeeMapCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: CoffeeMapFactory
    
    init(navigation: UINavigationController, factory: CoffeeMapFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension CoffeeMapCoordinator: CoffeeMapViewControllerCoordinator {
    
}
