//
//  ViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

import SnapKit

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
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
            make.height.equalTo(logoImageView.snp.width).multipliedBy(0.6)
            
        }
        
        logoImageView.layer.cornerRadius = 20
        
        logoImageView.layer.masksToBounds = true
        
    }

}

