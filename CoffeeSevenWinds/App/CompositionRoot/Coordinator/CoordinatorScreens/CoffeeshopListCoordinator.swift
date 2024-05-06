//
//  CoffeeshopListCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

final class CoffeeshopListCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: CoffeeshopListFactory
    
    init(navigation: UINavigationController, factory: CoffeeshopListFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension CoffeeshopListCoordinator: CoffeeshopListViewControllerCoordinator {
    
    func didTapOnMapButton(locations: [Location]) {
        let mapCoordinator = factory.makeMapCoordinator(navigation: navigation, locations: locations)
        mapCoordinator.start()
    }
    
    func didTapCell(id: Int) {
        let menuCoordinator = factory.makeMenuCoordinator(navigation: navigation, id: id)
        menuCoordinator.start()
        print("go to menu")
    }
    
}
