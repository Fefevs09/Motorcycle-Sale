//
//  ViewController.swift
//  Login app
//
//  Created by Felipe Vieira on 28/09/23.
//

import UIKit

class ViewController: UIViewController {
    let nextButton = UIButton()
    
    let painelImage = UIImageView()
    
    let mainText = UILabel()
    let subText = UILabel()
    
    let buttonSingIn = UIButton()
    let buttonLogin = UIButton()
    
    let scroll = UISegmentedControl(items: ["", "", ""])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setImage(painelImage)
        setMainTitle(mainText)
        setSubTitle(subText)
        setSegmented(scroll)
        
        //let scroll = setSegmented()
        
        let gestureR = UISwipeGestureRecognizer(target: self , action: #selector(swipeHandler))
        gestureR.direction = .right
        self.view!.addGestureRecognizer(gestureR)
        
        let gestureL = UISwipeGestureRecognizer(target: self , action: #selector(swipeHandler))
        gestureL.direction = .left
        self.view!.addGestureRecognizer(gestureL)
        
//        setupButton()
    }
    
    func setImage(_ painelImage: UIImageView) {
        painelImage.image = UIImage(resource: .painel1)
        
        painelImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(painelImage)
        
        NSLayoutConstraint.activate([
            painelImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            painelImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            painelImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            painelImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setMainTitle(_ mainText: UILabel) {
        mainText.text = "Easy to make transact, with Jumot"
        mainText.font = .systemFont(ofSize: 21, weight: .bold)
        mainText.textAlignment = .center
        mainText.textColor = .black
        mainText.numberOfLines = 0
        
        mainText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainText)
        
        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: painelImage.bottomAnchor, constant: 50),
            mainText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            mainText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
        
    }
    
    func setSubTitle(_ subTitle: UILabel) {
        let text = "The buying and selling business reaches all regions in Indonesia"
        subTitle.text = text
        subTitle.font = .systemFont(ofSize: 15, weight: .light)
        subTitle.textAlignment = .center
        subTitle.textColor = .black
        subTitle.numberOfLines = 0
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subTitle)
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 20),
            subTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            subTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
    }
    
    func setButtons(_ buttonSingIn: UIButton, _ buttonLogin: UIButton, _ Hidden: Bool) {
        let buttons = [buttonLogin, buttonSingIn]
        for bt in buttons {
            bt.isHidden = Hidden
            buttonLogin.configuration = .filled()
            buttonLogin.configuration?.baseBackgroundColor = .main
            buttonSingIn.configuration = .plain()
            buttonSingIn.layer.borderWidth = 2
            buttonSingIn.layer.borderColor = UIColor.main.cgColor
            buttonSingIn.layer.cornerRadius = 10
            bt.configuration?.cornerStyle = .medium
            buttonLogin.configuration?.title = "Login"
            buttonSingIn.configuration?.title = "Sing In"
            bt.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bt)
        }
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: subText.bottomAnchor, constant: 10),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalToConstant: 354),
            buttonLogin.heightAnchor.constraint(equalToConstant: 52),
            
            buttonSingIn.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 31),
            buttonSingIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSingIn.widthAnchor.constraint(equalToConstant: 354),
            buttonSingIn.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        
    }
    
    func setSegmented(_ scroll: UISegmentedControl) {
        scroll.backgroundColor = .backgroundSegmented
        scroll.selectedSegmentTintColor = .main
        scroll.selectedSegmentIndex = 0
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addTarget(self, action: #selector(changePainel), for: .valueChanged)
        
        view.addSubview(scroll)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: subText.bottomAnchor, constant: 180),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    
    func setupButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Next"
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), nextButton.widthAnchor.constraint(equalToConstant: 200), nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
        if gestureRecognizer.direction == UISwipeGestureRecognizer.Direction.left {
            scroll.selectedSegmentIndex += 1
            changePainel(scroll)
        } else if gestureRecognizer.direction == UISwipeGestureRecognizer.Direction.right {
            if scroll.selectedSegmentIndex > 0 {
                scroll.selectedSegmentIndex -= 1
                changePainel(scroll)
            }
        }
    }
    
    @objc func changePainel(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            painelImage.image = UIImage(resource: .painel1)
            subText.text = "The buying and selling business reaches all regions in Indonesia"
            setButtons(buttonSingIn, buttonLogin, true)
        case 1:
            painelImage.image = UIImage(resource: .painel2)
            subText.text = "Buying and selling can be done by cod to get check the items we are going to buy"
            setButtons(buttonSingIn, buttonLogin, true)
        case 2:
            painelImage.image = UIImage(resource: .painel3)
            subText.text = "Buy a vehicle according to your interests and with best negotiated price"
            setButtons(buttonSingIn, buttonLogin, false)
        default:
            painelImage.image = UIImage(resource: .painel1)
            subText.text = "The buying and selling business reaches all regions in Indonesia"
        }
    
    }

    @objc func goToLoginScreen() {
        let nextScreen = LoginViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}

