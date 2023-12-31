//
//  ListHolidaysViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation
import UIKit


class ListHolidaysViewController: UIViewController {
    
    private let viewModel: ListHolidaysViewModel
    
    private lazy var titleLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = .boldSystemFont(ofSize: 18)
          label.textColor = UIColor(red: 0.02, green: 0.31, blue: 0.41, alpha: 1.00)
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
        tableView.register(HolidayTableViewCell.self, forCellReuseIdentifier: HolidayTableViewCell.identifier)
        
        return tableView
    }()
    
    init(viewModel: ListHolidaysViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        setupView()
        self.titleLabel.text = (viewModel.isShortcut ? Constants.nextHolidays : viewModel.getCountry+" - "+viewModel.getYear)
        self.viewModel.delegate(delegate: self)
    }
}

extension ListHolidaysViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
        
    }
    
    func setupAditionalConfiguration() {
        let customBackButton = UIBarButtonItem(title: Constants.back, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton
        self.view.backgroundColor = .white
        
    }
    
    
}

extension ListHolidaysViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numbOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HolidayTableViewCell.identifier, for: indexPath) as? HolidayTableViewCell
        cell?.setUpInfo(holiday: self.viewModel.currentHoliday(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentHoliday = self.viewModel.currentHoliday(indexPath: indexPath)
        let viewModel = HolidayDetailsViewModel(holiday: currentHoliday)
        let detailViewController = HolidayDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }

}

extension ListHolidaysViewController: ReloadDataDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showAlert() {
        let alertManager = AlertManager()
        guard let navigationController = self.navigationController else { return }
        alertManager.showAlert(title: Constants.alertErrorTitle,
                               message: Constants.alertErrorMessag,
                               goBack: true,
                               navigationController: navigationController)

    }
    
    
}
