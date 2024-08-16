//
//  DetailsViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 15.08.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainView()
        
        setupNavigationBar()
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Details"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed, .font: UIFont.boldSystemFont(ofSize: 24)]
        
    }

}
