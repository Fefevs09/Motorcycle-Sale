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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setImage(painelImage)
        setMainTitle(mainText)
        setSubTitle(subText)
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
    
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}

