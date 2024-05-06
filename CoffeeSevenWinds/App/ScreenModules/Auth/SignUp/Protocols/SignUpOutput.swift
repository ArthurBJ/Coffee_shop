//
//  SignUpOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol SignUpOutput: AnyObject {
    func register(login: String?, password: String?)
}
