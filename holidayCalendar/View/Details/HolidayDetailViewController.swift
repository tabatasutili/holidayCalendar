//
//  HolidayDetailViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation
import UIKit

class HolidayDetailViewController: UIViewController {
    
    let viewModel:HolidayDetailsViewModel
    
    private lazy var titleLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = .boldSystemFont(ofSize: 22)
          label.textColor = UIColor(red: 0.18, green: 0.69, blue: 0.82, alpha: 1.00)
          label.numberOfLines = Constants.numberZero
          label.lineBreakMode = .byWordWrapping
          label.textAlignment = .center
          return label
        
       }()
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HolidayDetailsTableViewCell.self, forCellReuseIdentifier: HolidayDetailsTableViewCell.identifier)
        
        return tableView
    }()
    
    init(viewModel: HolidayDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        setupView()
        
    }
}

extension HolidayDetailViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func setupAditionalConfiguration() {
        self.titleLabel.text = Constants.titleDiteils
        self.view.backgroundColor = .white
    }
    
    
}

extension HolidayDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numbOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HolidayDetailsTableViewCell.identifier, for: indexPath) as? HolidayDetailsTableViewCell
        cell?.setUpInfo(currentDetail: self.viewModel.currentDetail(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
         return false
    }
}
