//
//  ListHolidaysViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation
import UIKit


class ListHolidaysViewController: UIViewController {
    
    let viewModel = ListHolidaysViewModel()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)

        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HolidayTableViewCell.self, forCellReuseIdentifier: HolidayTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        setupView()
//        self.viewModel.fetchCharacters(pagination: false)
        self.viewModel.delegate(delegate: self)
    }
}

extension ListHolidaysViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
        
    }
    
    func setupAditionalConfiguration() {
        //self.view.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.91, alpha: 1.00)
        
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicou na celula")
        let currentHoliday = self.viewModel.currentHoliday(indexPath: indexPath)
        //CharacterDetailViewModel(currentHoliday: currentHoliday)
        let detailViewController = HolidayDetailViewController()
        //detailViewController.character = character
        self.present(detailViewController, animated: true, completion: nil)
        
    }

}

extension ListHolidaysViewController: viewModelDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
}
