//
//  MenuViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 30.04.2024.
//

import UIKit

protocol MenuViewControllerCoordinator: AnyObject {
    func didTapGoToPayButton(order: [Menu]?)
}

final class MenuViewController: UIViewController {
    
    // MARK: - Properties
    private var coordinator: MenuViewControllerCoordinator
    private var presenter: MenuOutput
    
    
    // MARK: - Views
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        layout.minimumLineSpacing = 13
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var goToPayButton = SWButton(title: "Перейти к оплате")
    
    // MARK: - Initializers
    init(coordinator: MenuViewControllerCoordinator, presenter: MenuOutput) {
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
        
        presenter.getMenu()
        configView()
    }
    
    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        goToPayButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        setConstraints()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc private func didTapButton() {
        let filteredMenuItems = presenter.getCountFilteredMenuItems()
        coordinator.didTapGoToPayButton(order: filteredMenuItems)
    }
}


// MARK: - MenuInput
extension MenuViewController: MenuInput {
    func success() {
        collectionView.reloadData()
    }
    
    func failure(_ error: String) {
        print(error)
    }
    
}


// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.menuItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        let menuItem = presenter.getMenuItem(row: indexPath.row)
        cell.configure(menuItem: menuItem)
        cell.addCounterHandler = { (counter: Int) in
            self.presenter.addCountToMenuItem(row: indexPath.row, counter: counter)
        }
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem * 1.25)
    }
    
}

// MARK: - Layout
extension MenuViewController {
    
    private func setConstraints() {
        view.addSubview(collectionView)
        goToPayButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goToPayButton)
        
        NSLayoutConstraint.activate([
            goToPayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            goToPayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            goToPayButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 9),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: goToPayButton.topAnchor, constant: -10),
        ])
    }
}
