//
//  OrderViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 01.05.2024.
//

import UIKit

protocol OrderViewControllerCoordinator: AnyObject {
    func didTapPayButton()
}

final class OrderViewController: UIViewController {
    
    // MARK: - Properties
    private weak var coordinator: OrderViewControllerCoordinator?
    private var presenter: OrderOutput
    
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: OrderTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var gratitudeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время ожидания заказа \n 15 минут! \n Спасибо, что выбрали нас!"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "#846340")
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var payButton = SWButton(title: "Оплатить")
    
    // MARK: - Initializers
    init(coordinator: OrderViewControllerCoordinator, presenter: OrderOutput) {
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
    }
    
    // MARK: - Private methods
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        setConstraints()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
}


// MARK: - OrderInput
extension OrderViewController: OrderInput {
    
}


// MARK: - UITableViewDataSource
extension OrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countOfOrders
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseIdentifier, for: indexPath) as? OrderTableViewCell else { return UITableViewCell() }
        let order = presenter.getOrderItem(row: indexPath.row)
        cell.configure(order: order)
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension OrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - Layout
extension OrderViewController {
    
    private func setConstraints() {
        payButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(gratitudeLabel)
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            gratitudeLabel.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: -159),
            gratitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            gratitudeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: gratitudeLabel.topAnchor, constant: -15),
        ])
    }
}
