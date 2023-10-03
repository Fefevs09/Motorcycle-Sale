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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupImage(painelImage)
        setupEmailTextFild(emailTextField)
        setupPassTF(passTextField)
        setupButtonUnhidePass(buttonUnhide)
        setupButtonForgetPass(buttonForgetPass)
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
        
        buttonForgetPass.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonForgetPass)
        
        NSLayoutConstraint.activate([
            buttonForgetPass.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 5),
            buttonForgetPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
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
}
