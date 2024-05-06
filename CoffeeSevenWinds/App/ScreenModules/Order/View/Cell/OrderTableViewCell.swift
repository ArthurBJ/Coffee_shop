//
//  OrderTableViewCell.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 01.05.2024.
//

import UIKit

final class OrderTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var counter: Int = 0 {
        didSet {
            countLabel.text = String(counter)
        }
    }
    
    // MARK: - Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#F6E5D1")
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hexString: "#846340")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "200 руб"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(hexString: "#AF9479")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .light)
        button.tintColor = UIColor(hexString: "#846340")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        button.tintColor = UIColor(hexString: "#846340")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hexString: "#846340")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(order: Menu) {
        nameLabel.text = order.name
        priceLabel.text = String(order.price ?? 0) + " руб"
        countLabel.text = String(order.count)
    }
    
    // MARK: - Private methods
    @objc private func didTapMinusButton() {
        if counter > 0 {
            counter -= 1
        }
    }
    
    @objc private func didTapPlusButton() {
        if counter < 99 {
            counter += 1
        }
    }
    
}

// MARK: - Layout
extension OrderTableViewCell {
    
    private func setupView() {
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(minusButton)
        containerView.addSubview(plusButton)
        containerView.addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -93),
            nameLabel.heightAnchor.constraint(equalToConstant: 21),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.4),
            priceLabel.heightAnchor.constraint(equalToConstant: 17),
            
            minusButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            minusButton.widthAnchor.constraint(equalToConstant: 24),
            
            plusButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
            
            countLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 2),
            countLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 9),
            countLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -4),
        ])
    }
}

extension OrderTableViewCell: Reusable { }
