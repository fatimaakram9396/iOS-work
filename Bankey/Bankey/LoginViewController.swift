//
//  ViewController.swift
//  Bankey
//
//  Created by Fatima Akram on 07.03.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessage = UILabel()
    
    var userName: String? {
        return loginView.userNameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInAction) , for: .primaryActionTriggered)
        
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textColor = .systemRed
        errorMessage.textAlignment = .center
        errorMessage.numberOfLines = 0 //multi line
        errorMessage.isHidden = true
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessage)
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        //Error Message Label
        NSLayoutConstraint.activate([
            errorMessage.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessage.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
    }
}

extension LoginViewController {
    @objc func signInAction(sender: UIButton) {
        errorMessage.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = userName, let password = password else {
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password should not be empty")
            return
        }
        
        if username == "Fatima" && password == "Temp/123" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Username / Password Incorrect")
            
        }

    }
    
    private func configureView(withMessage message: String) {
        errorMessage.isHidden = false
        errorMessage.text = message
    }
}

