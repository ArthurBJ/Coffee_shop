//
//  MenuCollectionViewCell.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 30.04.2024.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var counter: Int = 0 {
        didSet {
            countLabel.text = String(counter)
        }
    }
    
    var addCounterHandler: ((Int) -> Void)?
    
    // MARK: - Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: WebImageView = {
        let view = WebImageView()
        view.backgroundColor = UIColor(hexString: "#AF9479")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(hexString: "#AF9479")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "200 руб"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hexString: "#846340")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hexString: "#846340")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = UIColor(hexString: "#F6E5D1")
        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = UIColor(hexString: "#F6E5D1")
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.set(imageURL: nil)
    }
    
    func configure(menuItem: Menu) {
        nameLabel.text = menuItem.name
        priceLabel.text = String(menuItem.price ?? 0) + " руб"
        imageView.set(imageURL: menuItem.imageURL)
    }
    
    // MARK: - Private methods
    @objc private func didTapMinusButton() {
        if counter > 0 {
            counter -= 1
            self.addCounterHandler?(counter)
        }
    }
    
    @objc private func didTapPlusButton() {
        if counter < 99 {
            self.counter += 1
            self.addCounterHandler?(counter)
        }
    }
}

// MARK: - Layout
extension MenuCollectionViewCell {
    
    private func setupView() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(minusButton)
        containerView.addSubview(plusButton)
        containerView.addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 2/3),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.4),
            priceLabel.heightAnchor.constraint(equalToConstant: 17),
            
            minusButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 4),
            minusButton.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            minusButton.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 24),

            plusButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            plusButton.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            plusButton.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
            
            countLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 9),
            countLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -4),
            countLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            countLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 2),
        ])
    }
}

extension MenuCollectionViewCell: Reusable { }
