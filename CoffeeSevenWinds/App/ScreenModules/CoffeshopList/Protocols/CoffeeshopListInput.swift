//
//  CoffeeshopListInput.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

protocol CoffeeshopListInput: AnyObject {
    func success()
    func failure(_ error: String)
}
