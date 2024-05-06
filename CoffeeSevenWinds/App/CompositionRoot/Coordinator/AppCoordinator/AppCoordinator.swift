//
//  AppCoordinator.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private var signUpCoordinator: Coordinator?
    private var signInCoordinator: Coordinator?
    private var coffeeshopListCoordinator: Coordinator?
    
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {        
        guard let token = UserDefaultsManager.shared.getToken(), let expiritionDate = token.tokenLifetime else { startAuthCoordinator(); return }
        if expiritionDate > Date() {
            startMainCoordinator()
        } else {
            startAuthCoordinator()
        }
         
    }
    
    private func startAuthCoordinator() {
        signUpCoordinator = appFactory.makeSignUpCoordinator(navigation: navigation)
        signUpCoordinator?.start()
    }
    
    private func startMainCoordinator() {
        coffeeshopListCoordinator = appFactory.makeMainCoordinator(navigation: navigation)
        coffeeshopListCoordinator?.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
        
}
