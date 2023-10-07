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

    }

}
