//
//  SearchView.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    lazy var titleLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = .boldSystemFont(ofSize: 22)
          label.text = Constants.searchTitle
          label.textColor = UIColor(red: 0.18, green: 0.69, blue: 0.82, alpha: 1.00)
          label.numberOfLines = Constants.numberZero
          label.lineBreakMode = .byWordWrapping
          label.textAlignment = .left
          label.layer.cornerRadius = 25
          return label
        
       }()
    
    lazy var countryTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = Constants.countryPlaceHolder
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    lazy var countryPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    lazy var yearTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = Constants.yearPlaceHolder
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    lazy var yearPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    lazy var searchButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(Constants.searchButton, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    
    init() {
        super.init(frame: UIScreen.main.bounds);
        setupView()
        //setUpInfo(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchView: ViewCode {
    func buildViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(countryTextField)
        self.addSubview(yearTextField)
        self.addSubview(searchButton)
       
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            countryTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countryTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            countryTextField.widthAnchor.constraint(equalToConstant: 300),
            
            yearTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearTextField.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearTextField.widthAnchor.constraint(equalToConstant: 300),
            
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 20),
            searchButton.widthAnchor.constraint(equalToConstant: 300)
            
            
            ])
        
    }
    
    func setupAditionalConfiguration() {
        countryTextField.inputView = countryPickerView
        yearTextField.inputView = yearPickerView
        countryTextField.tintColor = .clear
        yearTextField.tintColor = .clear

    }
    
    
}
