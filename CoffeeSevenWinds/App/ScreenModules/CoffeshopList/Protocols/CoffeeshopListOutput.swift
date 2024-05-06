//
//  CoffeeshopListOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol CoffeeshopListOutput: AnyObject {
    var locationsCount: Int { get }
    func getLocations()
    func getLocationModel(row: Int) -> Location
    func getMenuId(row: Int) -> Int
    func getLocationArray() -> [Location]
}
