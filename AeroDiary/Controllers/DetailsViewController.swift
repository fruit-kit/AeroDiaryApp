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
        
        stackView.backgroundColor = .red
        
        return stackView
        
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
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.snp.width)
        }
    }

}
