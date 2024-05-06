//
//  EndpointType.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 02.05.2024.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
