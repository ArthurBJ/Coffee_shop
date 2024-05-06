//
//  CoffeeMapPresenter.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 05.05.2024.
//

import Foundation

final class CoffeeMapPresenter: CoffeeMapOutput {
    
    weak var view: CoffeeMapInput?
    private var locations: [Location]
    
    var locationsCount: Int {
        return locations.count
    }
    
    init(view: CoffeeMapInput?, locations: [Location]) {
        self.view = view
        self.locations = locations
    }
    
    func getCoordinates() -> [(name: String, lattitide: Double, longitude: Double)] {
        guard locations.count != 0 else { return [] }
        var result: [(name: String, lattitide: Double, longitude: Double)] = []
        for i in 0..<locations.count {
            let lattitude = Double(locations[i].point?.latitude ?? "0.0") ?? 0.0
            let longitude = Double(locations[i].point?.longitude ?? "0.0") ?? 0.0
            let name = locations[i].name ?? ""
            result.append((name: name, lattitide: lattitude, longitude: longitude))
        }
        return result
    }
}
