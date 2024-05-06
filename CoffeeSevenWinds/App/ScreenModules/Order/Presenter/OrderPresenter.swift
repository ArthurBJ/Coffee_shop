//
//  OrderPresenter.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

final class OrderPresenter: OrderOutput {
    
    weak var view: OrderInput?
    private var orders: [Menu]
    
    var countOfOrders: Int {
        return orders.count
    }
    
    init(view: OrderInput?, orders: [Menu]) {
        self.view = view
        self.orders = orders
    }
    
    func getOrderItem(row: Int) -> Menu {
        let order = orders[row]
        return order
    }
    
}
