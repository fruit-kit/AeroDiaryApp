//
//  FlightViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

class FlightViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        
        return scrollView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        addSubviews()
        
        setupConstraints()
        
    }
    
    private func addSubviews() {
        
        view.addSubview(scrollView)
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Flight"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed, .font: UIFont.boldSystemFont(ofSize: 24)]
        
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            
            make.edges.equalTo(view.safeAreaLayoutGuide)
            
        }
        
    }
    
}
