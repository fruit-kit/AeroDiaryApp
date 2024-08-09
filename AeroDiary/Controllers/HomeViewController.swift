//
//  ViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
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
        
        label.textColor = .customGray
        
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        addSubviews()
        
        setupConstraints()
        
        setupLogoImageView()
        
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        
        view.addSubview(logoImageView)
        
        view.addSubview(recentlyFlights)
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Aero Diary"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed]
        
    }
    
    private func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
            make.height.equalTo(logoImageView.snp.width).multipliedBy(0.6)
            
        }
        
        recentlyFlights.snp.makeConstraints { make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
        }
        
    }
    
    private func setupLogoImageView() {
        
        logoImageView.layer.cornerRadius = 20
        
        logoImageView.layer.masksToBounds = true
        
    }
    
}

