//
//  SingInViewController.swift
//  Login app
//
//  Created by Felipe Vieira on 30/09/23.
//

import UIKit

enum TypeField {
    case Name
    case Email
    case Phone
    case Password
    case ConfirmPassword
}

struct FieldText {
    var ft: UITextField
    let tp: TypeField
}

class SingInViewController: UIViewController {
    
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
         return sv
    }()
    
    private let contentView: UIView = {
        let v = UIView()
            v.backgroundColor = .white
        return v
    }()
    
    private var painelImage: UIImageView = {
        let paIm = UIImageView()
        
        paIm.image = UIImage(resource: .painelSingIn)
        
        return paIm
    }()
    
    
    private let fieldsTextView: [UITextField] = {
        
        var fieldsText: [UITextField] = []
        
        for ft in 1...5 {
            let iv = UITextField()
            
            iv.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
            iv.leftViewMode = .always
            iv.backgroundColor = .white
            iv.layer.borderWidth = 2
            iv.layer.borderColor = UIColor.backgroundSegmented.cgColor
            iv.layer.cornerRadius = 10
            
            iv.translatesAutoresizingMaskIntoConstraints = false
            
            fieldsText.append(iv)
        }
        
        return fieldsText
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.setTitleColor(.white, for: .normal)
        button.configuration?.cornerStyle = .medium
        //button.layer.cornerRadius = Constants.CornerRadius.buttonWithTen
        button.setTitle("Register", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.configuration?.baseBackgroundColor = .main
        //button.configuration?.title = "Login"
        
        return button
    }()
    
    private let textHaveAccount: UILabel = {
        let label = UILabel()
        
        label.text = "Already have an account?"
        
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private let loginNow: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.main, for: .normal)
        //button.layer.cornerRadius = Constants.CornerRadius.buttonWithTen
        button.setTitle(" Please come in", for: .normal)
        button.titleLabel?.font = UIFont(name: "regular", size: 14)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupImage()
        self.setupFieldsTexts()
        self.setupRegisterButton()
        self.setupLoginNow()
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(scrollView)
        
        self.scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            //contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 2.0),
        ])
        
        
    }
    
    private func setupImage() {
        
        self.contentView.addSubview(painelImage)
        
        painelImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            painelImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
            painelImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            painelImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            painelImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        ])
    }
    
    private func fieldsText() -> [FieldText] {
        var fieldsText: [FieldText] = []
        
        
        for x in 0...4 {
            let enumsTypeField = [
                TypeField.Name,
                TypeField.Email,
                TypeField.Phone,
                TypeField.Password,
                TypeField.ConfirmPassword,
                
            ]
            
            let fts = FieldText(ft: fieldsTextView[x], tp: enumsTypeField[x])
            
            fieldsText.append(fts)
        }
        
        return fieldsText
    }
    
    private func setupFieldsTexts() {
        
        let fieldsText = fieldsText()
        
        var topAConstra: NSLayoutConstraint = fieldsText[0].ft.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 30)
        
        
        for field in fieldsText {
            
            switch field.tp {
            case .Name:
                    field.ft.placeholder = "Name"
                topAConstra = field.ft.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 30)
            case .Email:
                field.ft.placeholder = "Teste"
                topAConstra = field.ft.topAnchor.constraint(equalTo: fieldsText[0].ft.bottomAnchor, constant: 30)
            case .Phone:
                field.ft.placeholder = "Phone"
                topAConstra = field.ft.topAnchor.constraint(equalTo: fieldsText[1].ft.bottomAnchor, constant: 30)
            case .Password:
                field.ft.placeholder = "Password"
                topAConstra = field.ft.topAnchor.constraint(equalTo: fieldsText[2].ft.bottomAnchor, constant: 30)
            case .ConfirmPassword:
                field.ft.placeholder = "Confirm Password"
                topAConstra = field.ft.topAnchor.constraint(equalTo: fieldsText[3].ft.bottomAnchor, constant: 30)
                
                //let scrollActivate = fieldsText[4].ft.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                
                //scrollActivate.isActive = true
                
                
            }
            
            self.contentView.addSubview(field.ft)
            
            NSLayoutConstraint.activate([
                //fieldText.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 30),
                topAConstra,
                field.ft.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                field.ft.widthAnchor.constraint(equalToConstant: 350),
                field.ft.heightAnchor.constraint(equalToConstant: 52),
            
            ])
        }
        
    }

    
    private func setupRegisterButton() {
        
        registerButton.addTarget(self, action: #selector(registerCompleted), for: .touchUpInside)
        
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
        
            registerButton.topAnchor.constraint(equalTo: fieldsTextView[4].bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func setupLoginNow() {
        
        textHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        
        loginNow.addTarget(self, action: #selector(goToLoginScreen), for: .touchUpInside)
        
        self.contentView.addSubview(textHaveAccount)
        self.contentView.addSubview(loginNow)
        
        
        NSLayoutConstraint.activate([
            //registerNow.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 70),
            textHaveAccount.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30),
            textHaveAccount.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            
            loginNow.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30),
            loginNow.centerYAnchor.constraint(equalTo: textHaveAccount.centerYAnchor),
            loginNow.leftAnchor.constraint(equalTo: textHaveAccount.rightAnchor),
            
            textHaveAccount.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            loginNow.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    @objc func goToLoginScreen(_ sender: UIButton) {
        let nextScreen = LoginViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func registerCompleted(_ sender: UIButton) {
        let nextScreen = SingInCompletedView()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
