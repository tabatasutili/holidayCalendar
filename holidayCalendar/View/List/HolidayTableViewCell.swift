//
//  HolidayTableViewCell.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation

import UIKit

class HolidayTableViewCell: UITableViewCell {
    static let identifier:String = Constants.HolidayCellIdentifier
    
    private var viewModel:HolidayCellViewModel?
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
        
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = Constants.numberZero
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
            
        return label
        
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.view.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setUpInfo(holiday: HolidayModel) {
        self.viewModel = HolidayCellViewModel(holiday: holiday)
        self.nameLabel.text = viewModel?.getName
        self.dateLabel.text = viewModel?.getDate
        self.view.applyGradient(colors: [Helper().UIColorFromRGB(0x2B95CE).cgColor, Helper().UIColorFromRGB(0x2ECAD5).cgColor])
    }
    
}

extension HolidayTableViewCell: ViewCode {
    func buildViewHierarchy() {
        self.contentView.addSubview(view)
        self.view.addSubview(nameLabel)
        self.view.addSubview(dateLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 2),
            self.view.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            self.view.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -2),
            self.view.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 2),
            
            self.nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            self.nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            self.nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            self.dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            self.dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    func setupAditionalConfiguration() {

    }
}

