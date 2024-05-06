//
//  OrderOutput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol OrderOutput: AnyObject {
    var countOfOrders: Int { get }
    func getOrderItem(row: Int) -> Menu
}
