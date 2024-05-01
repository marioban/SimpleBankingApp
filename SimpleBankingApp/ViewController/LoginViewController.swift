//
//  LoginViewController.swift
//  SimpleBankingApp
//
//  Created by Mario Ban on 01.03.2024..
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let loginButton = SBButton(backgroundColor: .systemGreen, title: "Login")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLogoImageView()
        setupLoginButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: setup views
    
    func setupLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(systemName: "dollarsign.circle")
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(showLoginAlert), for: .touchUpInside)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(70)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.height.equalTo(50)
        }
    }
    
    @objc func showLoginAlert() {
        let alertVC = SBAlert(alertTitle: "Login Required")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true, completion: nil)
    }

    
}
