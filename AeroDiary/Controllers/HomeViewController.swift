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
    
    private let recentlyFlightsLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Recently flights:"
        
        label.textColor = .customGray
        
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        addSubviews()
        
        setupConstraints()
        
        setupLogoImageView()
        
        setupTableView()
        
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        
        view.addSubview(logoImageView)
        
        view.addSubview(recentlyFlightsLabel)
        
        view.addSubview(tableView)
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Aero Diary"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customRed, .font: UIFont.boldSystemFont(ofSize: 24)]
        
    }
    
    private func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
            make.height.equalTo(logoImageView.snp.width).multipliedBy(0.6)
            
        }
        
        recentlyFlightsLabel.snp.makeConstraints { make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            
            make.leading.equalTo(view.snp.leading).offset(16)
            
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            
        }
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(recentlyFlightsLabel.snp.bottom).offset(16)
            
            make.leading.equalTo(view.snp.leading)
            
            make.trailing.equalTo(view.snp.trailing)
            
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
    }
    
    private func setupLogoImageView() {
        
        logoImageView.layer.cornerRadius = 10
        
        logoImageView.layer.masksToBounds = true
        
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = .customBlack
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
}

// MARK: - Extensions

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .customBlack
        
        cell.selectionStyle = .none
        
        cell.contentView.subviews.forEach {
            
            $0.removeFromSuperview()
            
        }
        
        let customView = UIView()
        
        customView.backgroundColor = .customCellColor
        
        customView.layer.cornerRadius = 10
        
        customView.layer.masksToBounds = true
        
        cell.contentView.addSubview(customView)
        
        customView.snp.makeConstraints { make in
            
            make.top.equalTo(cell.contentView.snp.top).offset(8)
            
            make.leading.equalTo(cell.contentView.snp.leading).offset(16)
            
            make.trailing.equalTo(cell.contentView.snp.trailing).offset(-16)
            
            make.bottom.equalTo(cell.contentView.snp.bottom).offset(-8)
            
        }
        
        let flights = FlightsManager.shared.flights
        
        let index = indexPath.row
        
        let flightNameLabel = UILabel()
        
        flightNameLabel.text = flights[index].flightName
        
        flightNameLabel.textColor = .white
        
        let routeLabel = UILabel()
        
        routeLabel.text = flights[index].route
        
        routeLabel.textColor = .customGray
        
        let stackView = UIStackView(arrangedSubviews: [flightNameLabel, routeLabel])
        
        stackView.axis = .vertical
        
        stackView.spacing = 4
        
        stackView.alignment = .leading
        
        customView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            
            make.leading.equalTo(customView.snp.leading).offset(16)
            
            make.centerY.equalTo(customView)
            
            make.trailing.lessThanOrEqualTo(customView.snp.trailing).offset(-40)
            
        }
        
        let arrowImageView = UIImageView()
        
        arrowImageView.image = UIImage(systemName: "chevron.compact.right")
        
        arrowImageView.tintColor = .white
        
        customView.addSubview(arrowImageView)
        
        arrowImageView.snp.makeConstraints { make in
            
            make.trailing.equalTo(customView.snp.trailing).offset(-16)
            
            make.centerY.equalTo(customView)
            
            make.width.height.equalTo(24)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        88
        
    }
    
}
