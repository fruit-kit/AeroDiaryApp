//
//  HistoryViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

import SnapKit

class HistoryViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let sortButton = UIButton()
    
    private var flights: [FlightsManager.Flight] = FlightsManager.shared.flights
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        flights = FlightsManager.shared.flights
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        setupTableView()
        
        setupSortButton()
        
        setupConstraints()
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "History"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.customRed,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        
        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
    }
    
    private func setupSortButton() {
        
        sortButton.setTitle("Sort", for: .normal)
        
        sortButton.backgroundColor = .customRed
        
        sortButton.layer.cornerRadius = 5
        
        sortButton.addTarget(self, action: #selector(sortFlights), for: .touchUpInside)
        
        view.addSubview(sortButton)
        
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.leading.trailing.equalToSuperview()
            
            make.bottom.equalTo(sortButton.snp.top).offset(-16)
            
        }
        
        sortButton.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            
            make.width.equalTo(100)
            
            make.height.equalTo(40)
            
        }
        
    }
    
    @objc private func sortFlights() {
        
        let alert = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Date & Time", style: .default, handler: { _ in
            
            self.flights.sort {
                
                $0.dateTime < $1.dateTime
                
            }
            
            self.tableView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Name", style: .default, handler: { _ in
            
            self.flights.sort {
                
                $0.flightName < $1.flightName
                
            }
            
            self.tableView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return flights.count
        
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
        
        let flightNameLabel = UILabel()
        
        flightNameLabel.textColor = .white
        
        flightNameLabel.text = flights[indexPath.row].flightName
        
        let routeLabel = UILabel()
        
        routeLabel.textColor = .customGray
        
        routeLabel.text = flights[indexPath.row].route
        
        let stackView = UIStackView(arrangedSubviews: [flightNameLabel, routeLabel])
        
        stackView.axis = .vertical
        
        stackView.spacing = 4
        
        stackView.alignment = .leading
        
        customView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            
            make.leading.equalTo(customView.snp.leading).offset(16)
            
            make.centerY.equalTo(customView)
            
            make.trailing.lessThanOrEqualTo(customView.snp.trailing).offset(-32)
            
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
        
        return 88
        
    }
    
}
