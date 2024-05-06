//
//  Config.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 06.05.2024.
//

import Foundation

struct Config: Decodable {
    let API_KEY: String
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Could not find Config.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
