//
//  CoffeshopListViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

protocol CoffeeshopListViewControllerCoordinator: AnyObject {
    func didTapOnMapButton(locations: [Location])
    func didTapCell(id: Int)
}

final class CoffeshopListViewController: UIViewController {
    
    // MARK: - Properties
    private var coordinator: CoffeeshopListViewControllerCoordinator
    private var presenter: CoffeeshopListOutput
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CoffeshopListTableViewCell.self, forCellReuseIdentifier: CoffeshopListTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let onMapButton = SWButton(title: "На карте")
    
    
    // MARK: - Initializers
    init(coordinator: CoffeeshopListViewControllerCoordinator, presenter: CoffeeshopListOutput) {
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
        
        presenter.getLocations()
        configView()
    }
    
    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        setContraints()
        setupTableView()
        onMapButton.addTarget(self, action: #selector(didTapMapButton), for: .touchUpInside)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    @objc private func didTapMapButton() {
        let locations = presenter.getLocationArray()
        coordinator.didTapOnMapButton(locations: locations)
    }
}


// MARK: - CoffeeshopListInput
extension CoffeshopListViewController: CoffeeshopListInput {
    func success() {
        tableView.reloadData()
    }
    
    func failure(_ error: String) {
        print(error)
    }
    
}


// MARK: - UITableViewDataSource
extension CoffeshopListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.locationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoffeshopListTableViewCell.reuseIdentifier, for: indexPath) as? CoffeshopListTableViewCell else {
            return UITableViewCell()
        }
        
        let location = presenter.getLocationModel(row: indexPath.row)
        cell.configure(location: location)
        return cell

    }
    
}


// MARK: - UITableViewDelegate
extension CoffeshopListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuId = presenter.getMenuId(row: indexPath.row)
        coordinator.didTapCell(id: menuId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


// MARK: - Layout
private extension CoffeshopListViewController {
    
    func setContraints() {
        onMapButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(onMapButton)
        
        NSLayoutConstraint.activate([
            onMapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            onMapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            onMapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 9),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: onMapButton.topAnchor, constant: -10)
        ])
    }
}
