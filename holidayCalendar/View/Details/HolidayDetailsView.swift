//
//  HolidayDetailsView.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation
import Foundation
import UIKit

class HolidayDetailsView: UIView {
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
        
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
            
        return label
        
    }()
    
    lazy var internationalNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var globalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var fixedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        
    }()
    
    init(viewModel: HolidayDetailsViewModel) {
        super.init(frame: UIScreen.main.bounds);
        setupView()
        setUpInfo(viewModel: viewModel)
        self.view.applyGradient(colors: [UIColor.blue.cgColor, UIColor.purple.cgColor])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func setUpInfo(viewModel: HolidayDetailsViewModel) {
        self.nameLabel.text = viewModel.getName
        self.internationalNameLabel.text = viewModel.getInternationalName
        self.dateLabel.text = viewModel.getDate
        self.typeLabel.text = viewModel.getType
        self.statusLabel.text = viewModel.getStatus
        self.globalLabel.text = viewModel.getGobal
        self.fixedLabel.text = viewModel.getFixed
    }
    
}

extension HolidayDetailsView: ViewCode {
    func buildViewHierarchy() {
        self.addSubview(view)
        self.view.addSubview(nameLabel)
        self.view.addSubview(internationalNameLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(typeLabel)
        self.view.addSubview(statusLabel)
        self.view.addSubview(globalLabel)
        self.view.addSubview(fixedLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            self.nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //self.nameLabel.heightAnchor.constraint(equalToConstant: 250),
            self.nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            self.internationalNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            self.internationalNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.internationalNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.internationalNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            self.dateLabel.topAnchor.constraint(equalTo: internationalNameLabel.bottomAnchor, constant: 10),
            self.dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.typeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            self.typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.statusLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            self.statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.globalLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            self.globalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.fixedLabel.topAnchor.constraint(equalTo: globalLabel.bottomAnchor, constant: 5),
            self.fixedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = .clear
        
    }
    
    
}
