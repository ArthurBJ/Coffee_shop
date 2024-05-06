//
//  SignInCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

final class SignInCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let signInFactory: SignInFactory
    
    init(navigation: UINavigationController, signInFactory: SignInFactory) {
        self.navigation = navigation
        self.signInFactory = signInFactory
    }
    
    func start() {
        let controller = signInFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension SignInCoordinator: SignInViewControllerCoordinator {
    func didTapSignInButton() {
        let coffeeshopListCoordinator = signInFactory.makeCoffeeshopListCoordinator(navigation: navigation)
        coffeeshopListCoordinator.start()
    }
    
}
