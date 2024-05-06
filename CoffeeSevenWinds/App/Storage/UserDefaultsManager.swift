//
//  UserDefaultsManager.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 03.05.2024.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() { }
    
    private static let KEY_ACCESS_TOKEN = "auth_token"
    private static let KEY_ACCESS_TOKEN_EXPIRE = "auth_token_expire"
    
    func saveToken(token: TokenDTO?) {
        guard let token = token else { return }
        
        let defaults = UserDefaults.standard
        let expirationDate = Date().addingTimeInterval(TimeInterval(token.tokenLifetime ?? 0))
        defaults.set(token.token, forKey: UserDefaultsManager.KEY_ACCESS_TOKEN)
        defaults.set(expirationDate, forKey: UserDefaultsManager.KEY_ACCESS_TOKEN_EXPIRE)
    }
    
    func getToken() -> Token? {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: UserDefaultsManager.KEY_ACCESS_TOKEN) ?? ""
        let tokenLifetime = defaults.object(forKey: UserDefaultsManager.KEY_ACCESS_TOKEN_EXPIRE) as? Date
        return Token(token: token, tokenLifetime: tokenLifetime)
    }
}
