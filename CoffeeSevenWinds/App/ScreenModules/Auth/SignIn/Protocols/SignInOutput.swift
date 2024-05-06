//
//  SignInOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol SignInOutput: AnyObject {
    func login(login: String?, password: String?)
}
