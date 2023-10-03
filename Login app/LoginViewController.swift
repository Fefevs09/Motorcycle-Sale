//
//  SecondScreenViewController.swift
//  Login app
//
//  Created by Felipe Vieira on 28/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    let painelImage = UIImageView()
    let emailTextField = UITextField()
    let passTextField = UITextField()
    let buttonUnhide = UIButton()
    let buttonForgetPass = UIButton()
    let buttonLogin = UIButton()
    let registerNow = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupImage(painelImage)
        setupEmailTextFild(emailTextField)
        setupPassTF(passTextField)
        setupButtonUnhidePass(buttonUnhide)
        setupButtonForgetPass(buttonForgetPass)
        setupButtonLogin(buttonLogin)
        setupRegisterNow(registerNow)
    }
    
    
    func setupImage(_ painelImage: UIImageView) {
        painelImage.image = UIImage(resource: .painelLogin)
        
        painelImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(painelImage)
        
        NSLayoutConstraint.activate([
            painelImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            painelImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            painelImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            painelImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupEmailTextFild(_ textField: UITextField) {
        textField.placeholder = "Email"
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.backgroundSegmented.cgColor
        textField.layer.cornerRadius = 10
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
    func setupPassTF(_ textField: UITextField) {
        textField.placeholder = "Password"
        
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        
        textField.backgroundColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.backgroundSegmented.cgColor
        textField.layer.cornerRadius = 10
        
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.heightAnchor.constraint(equalToConstant: 52),
            
        ])
        
    }
    
    func setupButtonUnhidePass(_ buttonUnhide: UIButton) {
        buttonUnhide.configuration = .plain()
        buttonUnhide.configuration?.buttonSize = .small
        
        buttonUnhide.setImage(UIImage(systemName: "eye"), for: .normal)
        
        buttonUnhide.tintColor = UIColor.backgroundSegmented
        
        buttonUnhide.addTarget(self, action: #selector(switchHideButton), for: .touchUpInside)
        
        view.addSubview(buttonUnhide)
        buttonUnhide.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //buttonUnhide.rightAnchor.constraint(equalTo: passTextField.rightAnchor, constant: 30),
            buttonUnhide.centerYAnchor.constraint(equalTo: passTextField.centerYAnchor),
            buttonUnhide.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            buttonUnhide.widthAnchor.constraint(equalToConstant: 10),
            buttonUnhide.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setupButtonForgetPass(_ buttonForgetPass: UIButton) {
        buttonForgetPass.configuration = .plain()
        
        let titleButton = "Forget password?"
        buttonForgetPass.configuration?.title = titleButton
        buttonForgetPass.tintColor = .black
        buttonForgetPass.configuration?.buttonSize = .small
        
        buttonForgetPass.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonForgetPass)
        
        NSLayoutConstraint.activate([
            buttonForgetPass.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 5),
            buttonForgetPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
    func setupButtonLogin(_ buttonLogin: UIButton) {
        
        buttonLogin.configuration = .filled()
        buttonLogin.configuration?.baseBackgroundColor = .main
        buttonLogin.configuration?.cornerStyle = .medium
        buttonLogin.configuration?.title = "Login"
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: buttonForgetPass.bottomAnchor, constant: 24),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalToConstant: 354),
            buttonLogin.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        
    }
    
    func setupRegisterNow(_ registerNow: UILabel) {
        let buttonRegisteNow =  UIButton()
        
        //registerNow.text = "Don't have an account yet? Register now"
        registerNow.text = "Don't have an account yet? "
        registerNow.font = .systemFont(ofSize: 14, weight: .light)
        registerNow.textAlignment = .center
        registerNow.textColor = .black
        registerNow.numberOfLines = 0
        
        registerNow.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(registerNow)
        
        NSLayoutConstraint.activate([
            registerNow.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 70),
            registerNow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        ])
        
        buttonRegisteNow.configuration = .plain()
        buttonRegisteNow.configuration?.title = "Register Now"
        buttonRegisteNow.tintColor = .main
        
        buttonRegisteNow.addTarget(self, action: #selector(goToSingUp), for: .touchUpInside)
        buttonRegisteNow.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonRegisteNow)
        
        
        NSLayoutConstraint.activate([
            buttonRegisteNow.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 60),
            buttonRegisteNow.centerYAnchor.constraint(equalTo: registerNow.centerYAnchor),
            buttonRegisteNow.leftAnchor.constraint(equalTo: registerNow.rightAnchor, constant: -10),
        ])
    }
    
    @objc func switchHideButton(_ sender: UIButton) {
        passTextField.isSecureTextEntry.toggle()
        if passTextField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    @objc func goToSingUp(_ sender: UIButton) {
        let nextScreen = SingInViewController()
        
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
