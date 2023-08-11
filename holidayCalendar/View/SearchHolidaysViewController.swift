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
            textField.placeholder = "Enter text"
            textField.borderStyle = .roundedRect
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
            textField.placeholder = "Enter text"
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
    let Button: UIButton = {
            let textField = UIButton()
                        textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()

    let country = ["Option 1", "Option 2", "Option 3", "Option 4"]
    let year = [" 1", " 2", " 3", " 4"]

        
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countryTextField)
        view.addSubview(yearTextField)
        
        countryTextField.inputView = countryPickerView
        yearTextField.inputView = yearPickerView
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        addConstraints()
        
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            countryTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            countryTextField.widthAnchor.constraint(equalToConstant: 300),
            
            yearTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearTextField.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearTextField.widthAnchor.constraint(equalToConstant: 300)
            
            
            ])
        
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
