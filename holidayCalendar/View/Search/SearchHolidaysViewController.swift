//
//  SearchHolidaysViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation
import UIKit


class SearchHolidaysViewController: UIViewController {
    
    
    let searchView = SearchView()
    let serchViewModel = SearchHolidaysViewModel()
    let alertManager = AlertManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
        setupButton()
    }
    
    private func setupNavigation(){
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.18, green: 0.69, blue: 0.82, alpha: 1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        let rightBarButtonItem = UIBarButtonItem(title: Constants.local, style: UIBarButtonItem.Style.done, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        let customBackButton = UIBarButtonItem(title: Constants.back, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton
        
    }
    
    
    private func setupButton(){
        searchView.searchButton.applyGradientStyle(colors: [Helper().UIColorFromRGB(0x2B95CE).cgColor, Helper().UIColorFromRGB(0x2ECAD5).cgColor])

    }
    
    @objc func rightButtonTapped() {
        if let locale = Locale.current.regionCode {
            let viewModel = ListHolidaysViewModel(country: locale, year: Constants.stringEmpty, shortcut: true)
            let viewController = ListHolidaysViewController(viewModel:viewModel)
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            showAlert(title: Constants.alertLocalErroTitle, message:  Constants.alertLocalErromessage)
        }
    }
    
    @objc private func searchButtonTapped() {
        if let year = searchView.yearTextField.text, let country = searchView.countryTextField.text {
            if !(year.count == Constants.numberZero) && !(country.count == Constants.numberZero) {
                let viewModel = ListHolidaysViewModel(country: country, year: year, shortcut: false)
                let viewController = ListHolidaysViewController(viewModel:viewModel)
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                showAlert(title: Constants.alertEmptyTitle, message:  Constants.alertEmptyMessage)
            }
        } else{
            showAlert(title: Constants.alertEmptyTitle, message:  Constants.alertEmptyMessage)
        }
    }
    
    private func showAlert(title: String, message: String) {
        if let navController = self.navigationController {
            alertManager.showAlert(title: title,
                                   message: message,
                                   goBack: false,
                                   navigationController: navController)

        }
    }
}
    // MARK: - ViewCode

extension SearchHolidaysViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(searchView)
        
       
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
    }
    
    func setupAditionalConfiguration() {
        self.view.backgroundColor = .white
        
        searchView.countryPickerView.delegate = self
        searchView.countryPickerView.dataSource = self
        searchView.yearPickerView.delegate = self
        searchView.yearPickerView.dataSource = self
        searchView.countryTextField.delegate = self
        searchView.yearTextField.delegate = self
                
        searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    
}
    // MARK: - UIPickerViewDelegate

extension SearchHolidaysViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == searchView.countryPickerView {
            return serchViewModel.getCountrysCount

        } else if pickerView == searchView.yearPickerView{
            return serchViewModel.getYearsCount
            }
        return Constants.numberOne
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == searchView.countryPickerView {
            return serchViewModel.getCountry(row: row)

        } else if pickerView == searchView.yearPickerView{
                 return serchViewModel.getYear(row: row)
            }
        return Constants.stringEmpty
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == searchView.countryPickerView {
            searchView.countryTextField.text = serchViewModel.getCountryCode(row: row)
                  self.view.endEditing(false)
        } else if pickerView == searchView.yearPickerView{
            searchView.yearTextField.text = serchViewModel.getYear(row: row)
                  self.view.endEditing(false)
            }
    }

}

    // MARK: - UITextFieldDelegate

extension SearchHolidaysViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
     }
    
}



