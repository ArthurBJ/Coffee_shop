//
//  OrderCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 01.05.2024.
//

import UIKit

final class OrderCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: OrderFactory
    
    init(navigation: UINavigationController, factory: OrderFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
    
}

extension OrderCoordinator: OrderViewControllerCoordinator {
    
    func didTapPayButton() {
        print("Payed")
    }
    
}
