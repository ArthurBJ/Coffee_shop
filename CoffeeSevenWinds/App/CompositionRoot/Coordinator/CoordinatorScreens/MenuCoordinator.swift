//
//  MenuCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 30.04.2024.
//

import UIKit

final class MenuCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: MenuFactory
    
    init(navigation: UINavigationController, factory: MenuFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension MenuCoordinator: MenuViewControllerCoordinator {
    func didTapGoToPayButton(order: [Menu]?) {
        let orderCoordinator = factory.makeOrderCoordinator(navigation: navigation, order: order)
        orderCoordinator.start()
    }
    
}
