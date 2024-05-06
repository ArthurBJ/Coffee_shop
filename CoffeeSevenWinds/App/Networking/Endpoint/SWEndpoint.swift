//
//  SWEndpoint.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 03.05.2024.
//

import Foundation

public enum SWApi {
    case login(login: String, password: String)
    case register(login: String, password: String)
    case loadMenu(id: Int)
    case loadLocations
}

extension SWApi: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: "http://147.78.66.203:3210/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login/"
        case .register:
            return "auth/register"
        case .loadMenu(id: let id):
            return "location/\(id)/menu"
        case .loadLocations:
            return "locations"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .loadMenu:
            return .get
        case .loadLocations:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(login: let login, password: let password):
            return .requestParameters(bodyParameters: ["login": login, "password": password], urlParameters: [:])
        case .register(login: let login, password: let password):
            return .requestParameters(bodyParameters: ["login": login, "password": password], urlParameters: [:])
        case .loadMenu:
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: [:], additionHeaders: headers)
        case .loadLocations:
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return [:]
        case .register:
            return [:]
        case .loadMenu:
            return ["Authorization": "Bearer \(UserDefaultsManager.shared.getToken()?.token ?? "")"]
        case .loadLocations:
            return ["Authorization": "Bearer \(UserDefaultsManager.shared.getToken()?.token ?? "")"]
        }
    }
    
}
