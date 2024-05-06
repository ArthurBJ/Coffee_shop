//
//  SignUpFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

protocol SignUpFactory {
    func makeModule(coordinator: SignUpViewControllerCoordinator) -> UIViewController
    func makeCoffeeshopListCoordinator(navigation: UINavigationController) -> Coordinator
    
}

struct SignUpFactoryImpl: SignUpFactory {
    
    func makeModule(coordinator: SignUpViewControllerCoordinator) -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = SignUpPresenter(networkManager: networkManager, view: nil)
        let signUpViewController = SignUpViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = signUpViewController
        signUpViewController.title = AppLocalized.signUpTitle
        return signUpViewController
    }
    
    func makeCoffeeshopListCoordinator(navigation: UINavigationController) -> Coordinator {
        let coffeeshopListFactory = CoffeeshopListFactoryImpl()
        let coordinator = CoffeeshopListCoordinator(navigation: navigation, factory: coffeeshopListFactory)
        return coordinator
    }
}
