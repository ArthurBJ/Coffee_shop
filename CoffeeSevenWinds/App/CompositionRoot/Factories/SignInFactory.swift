//
//  SignInFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

protocol SignInFactory {
    func makeModule(coordinator: SignInViewControllerCoordinator) -> UIViewController
    func makeCoffeeshopListCoordinator(navigation: UINavigationController) -> Coordinator
}

struct SignInFactoryImpl: SignInFactory {
    
    func makeModule(coordinator: SignInViewControllerCoordinator) -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = SignInPresenter(networkManager: networkManager, view: nil)
        let signInViewController = SignInViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = signInViewController
        signInViewController.title = AppLocalized.signInTitle
        return signInViewController
    }
    
    func makeCoffeeshopListCoordinator(navigation: UINavigationController) -> Coordinator {
        let factory = CoffeeshopListFactoryImpl()
        let coordinator = CoffeeshopListCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
}
