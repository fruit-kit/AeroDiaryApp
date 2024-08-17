//
//  DetailsViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 15.08.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let stackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        stackView.spacing = 16
        
        stackView.alignment = .fill
        
        stackView.distribution = .fill
        
        stackView.backgroundColor = .customBlack
        
        return stackView
        
    }()
    
    let flightNumberLabel: UILabel = {
        
        let flightNumberLabel = UILabel()
        
        flightNumberLabel.font = .systemFont(ofSize: 18)
        
        flightNumberLabel.textAlignment = .center
        
        flightNumberLabel.backgroundColor = .customCellColor
        
        flightNumberLabel.textColor = .customGray
        
        flightNumberLabel.layer.cornerRadius = 10
        
        flightNumberLabel.clipsToBounds = true
        
        return flightNumberLabel
        
    }()
    
    let routeLabel: UILabel = {
        
        let routeLabel = UILabel()
        
        routeLabel.font = .systemFont(ofSize: 18)
        
        routeLabel.textAlignment = .center
        
        routeLabel.backgroundColor = .customCellColor
        
        routeLabel.textColor = .customGray
        
        routeLabel.layer.cornerRadius = 10
        
        routeLabel.clipsToBounds = true
        
        return routeLabel
        
    }()
    
    let dateTimeLabel: UILabel = {
        
        let dateTimeLabel = UILabel()
        
        dateTimeLabel.font = .systemFont(ofSize: 18)
        
        dateTimeLabel.textAlignment = .center
        
        dateTimeLabel.backgroundColor = .customCellColor
        
        dateTimeLabel.textColor = .customGray
        
        dateTimeLabel.layer.cornerRadius = 10
        
        dateTimeLabel.clipsToBounds = true
        
        return dateTimeLabel
        
    }()
    
    let noteLabel: UILabel = {
        
        let noteLabel = UILabel()
        
        noteLabel.font = .systemFont(ofSize: 18)
        
        noteLabel.textAlignment = .center
        
        noteLabel.backgroundColor = .customCellColor
        
        noteLabel.textColor = .customGray
        
        noteLabel.layer.cornerRadius = 10
        
        noteLabel.clipsToBounds = true
        
        return noteLabel
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        addSubviews()
        
        setupConstraints()
        
    }
    
    private func addSubviews() {
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(flightNumberLabel)
        
        stackView.addArrangedSubview(routeLabel)
        
        stackView.addArrangedSubview(dateTimeLabel)
        
        stackView.addArrangedSubview(noteLabel)
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Details"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed, .font: UIFont.boldSystemFont(ofSize: 24)]
        
    }
    
    private func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.leading.equalTo(view.snp.leading).inset(16)
            
            make.trailing.equalTo(view.snp.trailing).inset(16)
            
        }
        
        flightNumberLabel.snp.makeConstraints { make in
            
            make.height.equalTo(50)
            
        }
        
        routeLabel.snp.makeConstraints { make in
            
            make.height.equalTo(50)
            
        }
        
        dateTimeLabel.snp.makeConstraints { make in
            
            make.height.equalTo(50)
            
        }
        
        noteLabel.snp.makeConstraints { make in
            
            make.height.equalTo(50)
            
        }
        
    }
    
}
