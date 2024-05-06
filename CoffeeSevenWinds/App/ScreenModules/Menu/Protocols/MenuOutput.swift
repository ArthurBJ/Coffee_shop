//
//  MenuOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol MenuOutput: AnyObject {
    var menuItemCount: Int { get }
    func getMenu()
    func getMenuItem(row: Int) -> Menu
    func getCountFilteredMenuItems() -> [Menu]
    func addCountToMenuItem(row: Int, counter: Int)
}
