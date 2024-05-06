//
//  Location.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import Foundation

typealias LocationResponse = [Location]

struct Location: Decodable {
    let id: Int?
    let name: String?
    let point: Point?
}

struct Point: Decodable {
    let latitude: String?
    let longitude: String?
}
