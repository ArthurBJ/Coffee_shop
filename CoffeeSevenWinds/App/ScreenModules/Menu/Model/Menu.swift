//
//  Menu.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

typealias MenuResponse = [Menu]

struct Menu: Decodable {
    let name: String?
    let imageURL: String?
    let price: Int?
    var count: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageURL = "imageURL"
        case price = "price"
    }
}
