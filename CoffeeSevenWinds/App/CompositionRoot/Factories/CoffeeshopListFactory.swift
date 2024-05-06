//
//  CoffeeshopListFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

protocol CoffeeshopListFactory {
    func makeModule(coordinator: CoffeeshopListViewControllerCoordinator) -> UIViewController
    func makeMenuCoordinator(navigation: UINavigationController, id: Int) -> Coordinator
    func makeMapCoordinator(navigation: UINavigationController, locations: [Location]) -> Coordinator
}

struct CoffeeshopListFactoryImpl: CoffeeshopListFactory {
    
    func makeModule(coordinator: CoffeeshopListViewControllerCoordinator) -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = CoffeeshopListPresenter(networkManager: networkManager, view: nil)
        let controller = CoffeshopListViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = controller
        controller.title = AppLocalized.coffeeshopListTitle
        return controller
    }
    
    func makeMenuCoordinator(navigation: UINavigationController, id: Int) -> Coordinator {
        let factory = MenuFactoryImpl(id: id)
        let coordinator = MenuCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    func makeMapCoordinator(navigation: UINavigationController, locations: [Location]) -> Coordinator {
        let factory = CoffeeMapFactoryImpl(locations: locations)
        let coordinator = CoffeeMapCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
}
