//
//  ParameterEncoding.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 02.05.2024.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
