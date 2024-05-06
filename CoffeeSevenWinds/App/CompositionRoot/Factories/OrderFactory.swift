//
//  OrderFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 01.05.2024.
//

import UIKit

protocol OrderFactory {
    func makeModule(coordinator: OrderViewControllerCoordinator) -> UIViewController
}

struct OrderFactoryImpl: OrderFactory {
    
    private(set) var order: [Menu]?
    
    func makeModule(coordinator: OrderViewControllerCoordinator) -> UIViewController {
        let presenter = OrderPresenter(view: nil, orders: order ?? [])
        let controller = OrderViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = controller
        controller.title = "Ваш заказ"
        return controller
    }
}
