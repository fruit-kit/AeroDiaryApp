//
//  ViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "logo")
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .customBlack
        
        title = "Aero Diary"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed]
        
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.6)
        ])
        
        logoImageView.layer.cornerRadius = 20
        
        logoImageView.layer.masksToBounds = true
        
    }

}

