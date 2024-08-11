//
//  FlightViewController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit
import SnapKit

class FlightViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .customBlack
        
        return scrollView
        
    }()
    
    let contentView: UIView = {
        
        let view = UIView()
        
        return view
        
    }()
    
    let stackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        stackView.spacing = 16
        
        stackView.alignment = .fill
        
        return stackView
        
    }()
    
    let flightNameTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Flight name:"
        
        textField.textColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        
        textField.borderStyle = .roundedRect
        
        textField.backgroundColor = .customCellColor
        
        return textField
        
    }()
    
    let routeTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Route:"
        
        textField.textColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        
        textField.borderStyle = .roundedRect
        
        textField.backgroundColor = .customCellColor
        
        return textField
        
    }()
    
    let aircraftTypeTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Aircraft type:"
        
        textField.textColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        
        textField.borderStyle = .roundedRect
        
        textField.backgroundColor = .customCellColor
        
        return textField
        
    }()
    
    let dateTimeTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Date and time:"
        
        textField.textColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        
        textField.borderStyle = .roundedRect
        
        textField.backgroundColor = .customCellColor
        
        return textField
        
    }()
    
    let notesTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Note:"
        
        textField.textColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        
        textField.borderStyle = .roundedRect
        
        textField.backgroundColor = .customCellColor
        
        return textField
        
    }()
    
    let addFlightButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("Add flight", for: .normal)
        
        button.backgroundColor = .customGreen
        
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        button.layer.cornerRadius = 10
        
        button.snp.makeConstraints { make in
            
            make.height.equalTo(50)
            
        }
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupNavigationBar()
        
        addSubviews()
        
        setupConstraints()
        
        setupDatePicker()
        
    }
    
    private func setupMainView() {
        
        view.backgroundColor = .customBlack
        
    }
    
    private func setupNavigationBar() {
        
        title = "Add Flight"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.customRed,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
    }
    
    private func setupDatePicker() {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .dateAndTime
        
        datePicker.preferredDatePickerStyle = .wheels
        
        datePicker.locale = Locale(identifier: "en_GB")
        
        dateTimeTextField.inputView = datePicker
        
        let toolbar = UIToolbar()
        
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        
        toolbar.setItems([doneButton], animated: true)
        
        dateTimeTextField.inputAccessoryView = toolbar
        
    }
    
    @objc private func doneTapped() {
        
        if let datePicker = dateTimeTextField.inputView as? UIDatePicker {
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .medium
            
            dateFormatter.timeStyle = .short
            
            dateTimeTextField.text = dateFormatter.string(from: datePicker.date)
            
        }
        
        dateTimeTextField.resignFirstResponder()
        
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            
            make.edges.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        contentView.snp.makeConstraints { make in
            
            make.edges.equalTo(scrollView)
            
            make.width.equalTo(scrollView)
            
        }
        
        stackView.snp.makeConstraints { make in
            
            make.edges.equalTo(contentView).inset(16)
            
        }
        
    }
    
    private func addSubviews() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(flightNameTextField)
        
        stackView.addArrangedSubview(routeTextField)
        
        stackView.addArrangedSubview(aircraftTypeTextField)
        
        stackView.addArrangedSubview(dateTimeTextField)
        
        stackView.addArrangedSubview(notesTextField)
        
        stackView.addArrangedSubview(addFlightButton)
        
    }
    
}
