//
//  CoffeeMapOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 05.05.2024.
//

import Foundation

protocol CoffeeMapOutput: AnyObject {
    var locationsCount: Int { get }
    func getCoordinates() -> [(name: String, lattitide: Double, longitude: Double)]
}
