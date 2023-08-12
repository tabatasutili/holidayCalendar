//
//  HolidayTableViewCell.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation

import UIKit

class HolidayTableViewCell: UITableViewCell {
    static let identifier:String = "HolidayTableViewCell"
    
    var viewModel:HolidayCellViewModel?
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
        
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
            
            
        return label
        
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public func setUpInfo(holiday: HolidayModel) {
        self.viewModel = HolidayCellViewModel(holiday: holiday)
        self.nameLabel.text = viewModel?.getName
        self.dateLabel.text = viewModel?.getDate
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
        //self.contentView.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        
    }
}
