//
//  SignInViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 29.04.2024.
//

import UIKit

protocol SignInViewControllerCoordinator: AnyObject {
    func didTapSignInButton()
}

final class SignInViewController: UIViewController {
    
    // MARK: - Properties
    private weak var coordinator: SignInViewControllerCoordinator?
    private var presenter: SignInOutput
    
    
    // MARK: - Views
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = AppLocalized.email
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(hexString: "#846340")
        return label
    }()
    
    private let emailTextField = SWTextField(placeholder: AppLocalized.placeholderExample)
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = AppLocalized.password
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(hexString: "#846340")
        return label
    }()
    
    private let passwordTextField = SWTextField(placeholder: AppLocalized.enterPassword)
    
    private let signInButton = SWButton(title: AppLocalized.signInButton)
    
    
    // MARK: - Initializers
    init(coordinator: SignInViewControllerCoordinator, presenter: SignInOutput) {
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
        
        configView()
    }
    
    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        setConstraints()
        signInButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        presenter.login(login: emailTextField.text, password: passwordTextField.text)
    }
}


// MARK: - SignInInput
extension SignInViewController: SignInInput {
    func success() {
        coordinator?.didTapSignInButton()
    }
    
    func failure(_ error: String) {
        print(error)
    }
    
}

// MARK: - Layout
private extension SignInViewController {
    
    func setConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 8)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 8)
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, signInButton], axis: .vertical, spacing: 25)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18)
        ])
    }
}
