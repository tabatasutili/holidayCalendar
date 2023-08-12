//
//  SearchHolidaysViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation


import UIKit

class SearchHolidaysViewController: UIViewController {
    
    let countryTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Escolha o país"
            textField.borderStyle = .roundedRect
            //textField.edit = .
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    let countryPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    let yearTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Escolha o ano"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    let yearPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    let searchButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Pesquisar", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

    let country = ["BR", "BB", "DK", "MG"]
    let year = ["2023", "2024", "2021", "2022"]

   
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(countryTextField)
        view.addSubview(yearTextField)
        view.addSubview(searchButton)
        
        config()
        addConstraints()
        
        
    }
    
    @objc func rightButtonTapped() {
           print("Right button tapped!")
           // Add your desired action here
       }
    
    func config() {
        title = "Feriados"
        navigationController?.isNavigationBarHidden = false
        navigationController?.isNavigationBarHidden = false
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.view.backgroundColor = .white
        
        
        countryTextField.inputView = countryPickerView
        yearTextField.inputView = yearPickerView
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        countryTextField.delegate = self
        yearTextField.delegate = self
        countryTextField.tintColor = .clear
        yearTextField.tintColor = .clear
                
        searchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            countryTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            countryTextField.widthAnchor.constraint(equalToConstant: 300),
            
            yearTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearTextField.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearTextField.widthAnchor.constraint(equalToConstant: 300),
            
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 20),
            searchButton.widthAnchor.constraint(equalToConstant: 300)
            
            
            ])
        
    }
    
    @objc func buttonTapped() {
        if !(yearTextField.text!.count == 0) && !(countryTextField.text!.count == 0) {
            print("Button tapped! \(country)")
            print("Button tapped! \(yearTextField.text)")
            let viewController = ListHolidaysViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("Selecione os compos de país e ano para continuar")
        }
        
    }
    
}

extension SearchHolidaysViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == countryPickerView {
                return country.count

            } else if pickerView == yearPickerView{
                 return year.count
            }
        return 1
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPickerView {
                return country[row]

            } else if pickerView == yearPickerView{
                 return year[row]
            }
            return ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPickerView {
            countryTextField.text = country[row]
                  self.view.endEditing(false)
            } else if pickerView == yearPickerView{
             yearTextField.text = year[row]
                  self.view.endEditing(false)
            }
    }

}
extension SearchHolidaysViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
     }
    
}
