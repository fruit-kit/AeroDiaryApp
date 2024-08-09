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
    
    private let recentlyFlights: UILabel = {
        
        let label = UILabel()
        
        label.text = "Recently flights:"
        
        label.textColor = .customGrayLabel
        
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .customBlack
        
        addSubviews()
        
        title = "Aero Diary"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed]
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
            make.height.equalTo(logoImageView.snp.width).multipliedBy(0.6)
            
        }
        
        logoImageView.layer.cornerRadius = 20
        
        logoImageView.layer.masksToBounds = true
        
        recentlyFlights.snp.makeConstraints({ make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
        })
        
    }
    
    private func addSubviews() {
        
        view.addSubview(logoImageView)
        
        view.addSubview(recentlyFlights)
        
    }
    
}

