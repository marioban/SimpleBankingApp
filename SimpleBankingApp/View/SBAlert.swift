//
//  SBAlert.swift
//  SimpleBankingApp
//
//  Created by Mario Ban on 01.05.2024..
//

import UIKit
import SnapKit

class SBAlert: UIViewController {
    
    let containerView = UIView()
    let titleLabel = SBLabel(textAlignment: .center, fontSize: 20)
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let actionButton = SBButton(backgroundColor: .systemPink, title: "Login")
    
    var alertTitle: String?
    
    init(alertTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        setupContainer()
        setupTitleLabel()
        setupTextFields()
        setupLoginButton()
    }
    
    // MARK: Setup views
    func setupContainer() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(260)
        }
    }
    
    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Login Required"
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(28)
        }
    }
    
    func setupTextFields() {
        usernameTextField.placeholder = "Enter your username"
        usernameTextField.borderStyle = .roundedRect
        containerView.addSubview(usernameTextField)
        
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        containerView.addSubview(passwordTextField)
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
    
    func setupLoginButton() {
        containerView.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(attemptLogin), for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
    
    // MARK: Functionalities
    @objc func attemptLogin() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            print("Please fill in both fields.")
            return
        }
        
        if username == "admin" && password == "1234" {
            print("Login Successful")
            navigateToTransactionsViewController()
        } else {
            print("Invalid credentials")
        }
    }
    
    func navigateToTransactionsViewController() {
        let transactionVC = TransactionsViewController()
        let navController = UINavigationController(rootViewController: transactionVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }

}
