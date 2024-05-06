//
//  SignUpCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

final class SignUpCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let signUpFactory: SignUpFactory
    
    init(navigation: UINavigationController, signUpFactory: SignUpFactory) {
        self.navigation = navigation
        self.signUpFactory = signUpFactory
    }
    
    func start() {
        let controller = signUpFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension SignUpCoordinator: SignUpViewControllerCoordinator {
    func didTapSignUpButton() {
        let coordinator = signUpFactory.makeCoffeeshopListCoordinator(navigation: navigation)
        coordinator.start()
    }
    
}
