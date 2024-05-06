//
//  CoffeeshopListPresenter.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

final class CoffeeshopListPresenter: CoffeeshopListOutput {
    
    private let networkManager: NetworkManager
    weak var view: CoffeeshopListInput?
    private var locations = [Location]()
    
    var locationsCount: Int {
        return locations.count
    }
    
    init(networkManager: NetworkManager, view: CoffeeshopListInput?) {
        self.networkManager = networkManager
        self.view = view
    }
    
    func getLocations() {
        networkManager.loadLocations { success, error in
            if let error = error {
                self.view?.failure(error)
            }
            
            guard let location = success else { return }
            self.locations = location
            DispatchQueue.main.async {
                self.view?.success()
            }
        }
    }
    
    func getLocationModel(row: Int) -> Location {
        let location = locations[row]
        return location
    }
    
    func getMenuId(row: Int) -> Int {
        guard let menuId = locations[row].id else { return 0 }
        return menuId
    }
    
    func getLocationArray() -> [Location] {
        return locations
    }
    
    //TODO: func getLocationArray() -> [(name: String, lattitude: Double, longitude: Double)]
}
