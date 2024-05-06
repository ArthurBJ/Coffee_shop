//
//  AppFactory.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

protocol AppFactory {
    func makeSignUpCoordinator(navigation: UINavigationController) -> Coordinator
    func makeSignInCoordiantor(navigation: UINavigationController) -> Coordinator
    func makeMainCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImpl: AppFactory {
    
    func makeSignUpCoordinator(navigation: UINavigationController) -> Coordinator {
        let signUpFactory = SignUpFactoryImpl()
        let signUpCoordinator = SignUpCoordinator(navigation: navigation, signUpFactory: signUpFactory)
        return signUpCoordinator
    }
    
    func makeSignInCoordiantor(navigation: UINavigationController) -> Coordinator {
        let signInFactory = SignInFactoryImpl()
        let signInCoordiantor = SignInCoordinator(navigation: navigation, signInFactory: signInFactory)
        return signInCoordiantor
    }
    
    func makeMainCoordinator(navigation: UINavigationController) -> Coordinator {
        let coffeeshopListFactory = CoffeeshopListFactoryImpl()
        let coffeeshopListCoordinator = CoffeeshopListCoordinator(navigation: navigation, factory: coffeeshopListFactory)
        return coffeeshopListCoordinator
    }
    
}

