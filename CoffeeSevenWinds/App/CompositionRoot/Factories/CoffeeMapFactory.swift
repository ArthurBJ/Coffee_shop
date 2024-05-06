//
//  CoffeeMapFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 05.05.2024.
//

import UIKit

protocol CoffeeMapFactory {
    func makeModule(coordinator: CoffeeMapViewControllerCoordinator) -> UIViewController
}

struct CoffeeMapFactoryImpl: CoffeeMapFactory {
    
    private(set) var locations: [Location]
    
    func makeModule(coordinator: CoffeeMapViewControllerCoordinator) -> UIViewController {
        var presenter = CoffeeMapPresenter(view: nil, locations: locations)
        let controller = CoffeeMapViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = controller
        controller.title = "Карта"
        return controller
    }
}
