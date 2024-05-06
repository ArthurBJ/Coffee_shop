//
//  ViewController.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 26.04.2024.
//

import UIKit

protocol SignUpViewControllerCoordinator: AnyObject {
    func didTapSignUpButton()
}

final class SignUpViewController: UIViewController {
    
    // MARK: Properties
    private weak var coordinator: SignUpViewControllerCoordinator?
    private var presenter: SignUpOutput
    
    
    // MARK: Views
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
    
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = AppLocalized.repeatPassword
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(hexString: "#846340")
        return label
    }()
    
    private let repeatPasswordTextField = SWTextField(placeholder: AppLocalized.repeatPassword)
    private let signUpButton = SWButton(title: AppLocalized.signUpButton)
    
    
    // MARK: - Initializers
    init(coordinator: SignUpViewControllerCoordinator, presenter: SignUpOutput) {
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
        
        signUpButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        presenter.register(login: emailTextField.text, password: passwordTextField.text)
    }

}


// MARK: - SignUpInput
extension SignUpViewController: SignUpInput {
    
    func success() {
        coordinator?.didTapSignUpButton()
    }
    
    func failure(_ error: String) {
        print(error)
    }
}


// MARK: - Layout
private extension SignUpViewController {
    
    func setConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 8)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 8)
        let repeatPasswordStackView = UIStackView(arrangedSubviews: [repeatPasswordLabel, repeatPasswordTextField], axis: .vertical, spacing: 8)
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, repeatPasswordStackView, signUpButton], axis: .vertical, spacing: 25)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18)
        ])
    }
}
