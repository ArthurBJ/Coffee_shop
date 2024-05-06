//
//  MenuPresenter.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 04.05.2024.
//

import Foundation

final class MenuPresenter: MenuOutput {
    
    private let networkManager: NetworkManager
    weak var view: MenuInput?
    private var menuItems = [Menu]()
    
    private var id: Int
    
    var menuItemCount: Int {
        menuItems.count
    }
    
    init(networkManager: NetworkManager, view: MenuInput?, id: Int) {
        self.networkManager = networkManager
        self.view = view
        self.id = id
    }
    
    func getMenu() {
        networkManager.loadMenu(id: id) { success, error in
            if let error = error {
                self.view?.failure(error)
            }
            
            guard let items = success else { print("No data"); return }
            self.menuItems = items
            DispatchQueue.main.async {
                self.view?.success()
            }
        }
    }
    
    func getMenuItem(row: Int) -> Menu {
        let menu = menuItems[row]
        return menu
    }
    
    func addCountToMenuItem(row: Int, counter: Int) {
        menuItems[row].count = counter
    }
    
    func getCountFilteredMenuItems() -> [Menu] {
        let filteredItems = menuItems.filter { $0.count > 0 }
        return filteredItems
    }
}
