//
//  CoffeeMapViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 05.05.2024.
//

import UIKit
import YandexMapsMobile

protocol CoffeeMapViewControllerCoordinator: AnyObject {
    
}

final class CoffeeMapViewController: UIViewController {
    
    // MARK: - Properties
    private var coordinator: CoffeeMapViewControllerCoordinator
    private var presenter: CoffeeMapOutput
    
    
    // MARK: - Views
    private lazy var mapView: YMKMapView = {
        let mapView = YMKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private var map: YMKMap!
    
    // MARK: - Initializers
    init(coordinator: CoffeeMapViewControllerCoordinator, presenter: CoffeeMapOutput) {
        self.coordinator = coordinator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupMap()
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        setConstraints()
    }
    
    private func setupMap() {
        map = mapView.mapWindow.map
        move()
        getLocation()
    }
    
    private func getLocation() {
        let locations = presenter.getCoordinates()
        for i in 0..<presenter.locationsCount {
            addPlacemark(pointOnMap: locations[i])
        }
    }
    
    private func move(to cameraPosition: YMKCameraPosition = Const.cameraPosition) {
        map.move(with: cameraPosition,
                 animation: YMKAnimation(type: .smooth, duration: 5.0),
                 cameraCallback: nil)
    }
    
    private func addPlacemark(pointOnMap: (name: String, lattitide: Double, longitude: Double)) {
        let image = UIImage(named: "coffee") ?? UIImage()
        let placemark = map.mapObjects.addPlacemark()
        placemark.geometry = YMKPoint(latitude: pointOnMap.lattitide, longitude: pointOnMap.longitude)
        placemark.setIconWith(image)
        
        placemark.setTextWithText(
            pointOnMap.name,
            style: YMKTextStyle(
                size: 10.0,
                color: UIColor(hexString: "#846340"),
                outlineWidth: 2.0,
                outlineColor: .white,
                placement: .bottom,
                offset: 0.0,
                offsetFromIcon: true,
                textOptional: false
            )
        )
    }
    
}


// MARK: - CoffeeMapInput
extension CoffeeMapViewController: CoffeeMapInput {
    
}

struct Const {
    static let cameraPosition = YMKCameraPosition(target: YMKPoint(latitude: 44.43000000000000, longitude: 44.43000000000000), zoom: 15.0, azimuth: 0.0, tilt: 0.0)
}


// MARK: - Layout
private extension CoffeeMapViewController {
    func setConstraints() {
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
