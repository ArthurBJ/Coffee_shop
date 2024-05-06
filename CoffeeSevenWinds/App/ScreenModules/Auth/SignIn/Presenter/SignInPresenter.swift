//
//  SignInPresenter.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

final class SignInPresenter: SignInOutput {
    
    private let networkManager: NetworkManager
    weak var view: SignInInput?
    
    init(networkManager: NetworkManager, view: SignInInput?) {
        self.networkManager = networkManager
        self.view = view
    }
    
    func login(login: String?, password: String?) {
        guard let login = login, let password = password else { return }
        networkManager.register(login: login, password: password) { success, error in
            if let error = error {
                self.view?.failure(error)
                return
            }
            
            UserDefaultsManager.shared.saveToken(token: success)
            DispatchQueue.main.async {
                self.view?.success()
            }
        }
    }
}
