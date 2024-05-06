//
//  MenuFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 30.04.2024.
//

import UIKit

protocol MenuFactory {
    func makeModule(coordinator: MenuViewControllerCoordinator) -> UIViewController
    func makeOrderCoordinator(navigation: UINavigationController, order: [Menu]?) -> Coordinator
}

struct MenuFactoryImpl: MenuFactory {
    
    private(set) var id: Int
    
    func makeModule(coordinator: MenuViewControllerCoordinator) -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = MenuPresenter(networkManager: networkManager, view: nil, id: id)
        let controller = MenuViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = controller
        controller.title = "Меню"
        return controller
    }
    
    func makeOrderCoordinator(navigation: UINavigationController, order: [Menu]?) -> Coordinator {
        let orderFactory = OrderFactoryImpl(order: order)
        let orderCoordinator = OrderCoordinator(navigation: navigation, factory: orderFactory)
        return orderCoordinator
    }
}
