//
//  SingInCompletedView.swift
//  Login app
//
//  Created by Felipe Vieira on 07/10/23.
//

import UIKit

class SingInCompletedView: UIViewController {
    
    // painel image sing in completed
    private let painelImageView: UIImageView = {
        let pi = UIImageView()
        
        pi.image = UIImage(resource: .painelThanksForSingIn)
        
        pi.translatesAutoresizingMaskIntoConstraints = false
        return pi
    }()
    
    
    private let titlePainel: UILabel = {
        let tp = UILabel()
        
        tp.text = "Happy! You have successfully registered"
        
        tp.font = .systemFont(ofSize: 21, weight: .bold)
        tp.textAlignment = .center
        tp.textColor = .black
        tp.numberOfLines = 0
        
        tp.translatesAutoresizingMaskIntoConstraints = false
        return tp
    }()
    
    private let subTitlePainel: UILabel = {
        let stp = UILabel()
        
        stp.text = "Please check your email to do so Verify before logging in."
        
        stp.font = .systemFont(ofSize: 15, weight: .light)
        stp.textAlignment = .center
        stp.textColor = .black
        stp.numberOfLines = 0
        
        stp.translatesAutoresizingMaskIntoConstraints = false
        return stp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPainelImage()
        
        setupTexts()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func setupPainelImage() {
        view.addSubview(painelImageView)
        
        NSLayoutConstraint.activate([
            painelImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            painelImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            painelImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            painelImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func setupTexts() {
        
        view.addSubview(titlePainel)
        view.addSubview(subTitlePainel)
        
        
        NSLayoutConstraint.activate([
            titlePainel.topAnchor.constraint(equalTo: painelImageView.bottomAnchor, constant: 50),
            titlePainel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            titlePainel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            
            
            subTitlePainel.topAnchor.constraint(equalTo: titlePainel.bottomAnchor, constant: 20),
            subTitlePainel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            subTitlePainel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
        
    }
}
