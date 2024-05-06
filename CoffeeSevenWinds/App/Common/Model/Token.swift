//
//  Token.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 03.05.2024.
//

import Foundation

struct Token {
    var token: String
    var tokenLifetime: Date?
}

struct TokenDTO: Codable {
    var token: String?
    var tokenLifetime: Int?
}
