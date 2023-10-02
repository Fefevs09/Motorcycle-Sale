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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupImage(painelImage)
        setupEmailTextFild(emailTextField)
        setupPassTF(passTextField)
        setupButtonUnhidePass(buttonUnhide)
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
            textField.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 50),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }

}
