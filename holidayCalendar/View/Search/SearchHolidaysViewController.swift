//
//  SearchHolidaysViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation


import UIKit

class SearchHolidaysViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = .boldSystemFont(ofSize: 20)
          label.text = "Pesquise feriados através do ano e país"
          label.textColor = .black
          label.numberOfLines = 0
          label.lineBreakMode = .byWordWrapping
          label.textAlignment = .left
          return label
        
       }()
    
    private lazy var countryTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Escolha o país"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    private lazy var countryPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    private lazy var yearTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Escolha o ano"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    private lazy var yearPickerView: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = .white
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
    private lazy var searchButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Pesquisar", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

    let country = ["BR", "BB", "DK", "MG"]
    let year = ["2023", "2024", "2021", "2022"]

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(countryTextField)
        view.addSubview(yearTextField)
        view.addSubview(searchButton)
        
        config()
        addConstraints()
        searchButton.applyGradientStyle(colors: [self.UIColorFromRGB(0x2B95CE).cgColor, self.UIColorFromRGB(0x2ECAD5).cgColor])
        
        
    }
    
    @objc func rightButtonTapped() {
           print("Right button tapped!")
           // Add your desired action here
       }
    
    private func config() {
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
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            countryTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            countryTextField.widthAnchor.constraint(equalToConstant: 300),
            
            yearTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearTextField.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
            yearTextField.widthAnchor.constraint(equalToConstant: 300),
            
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 20),
            searchButton.widthAnchor.constraint(equalToConstant: 300)
            
            
            ])
        
    }
    
    @objc private func buttonTapped() {
        if let year = yearTextField.text, let country = countryTextField.text {
            if !(year.count == 0) && !(country.count == 0) {
                print("Button tapped! \(country)")
                print("Button tapped! \(year)")
                let viewModel = ListHolidaysViewModel(country: country, year: year)
                let viewController = ListHolidaysViewController(viewModel:viewModel)
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                print("Selecione os compos de país e ano para continuar")
            }
        } else{
            
        }
        
        
    }
    
    func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0, blue: ((CGFloat)((rgbValue & 0x0000FF)))/255.0, alpha: 1.0)
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

extension UIButton {
    func applyGradientStyle(colors: [CGColor]) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 8

        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 5.0
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = false

        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.textColor = UIColor.white
    }
    
    
}

extension UIView {
    func applyGradient(colors: [CGColor], startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 1, y: 0)) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
            
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = self.bounds
        //gradientLayer.frame.size = self.frame.size

        gradientLayer.cornerRadius = self.layer.cornerRadius

        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 8
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = false

        self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }



class Helper {
    func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0, blue: ((CGFloat)((rgbValue & 0x0000FF)))/255.0, alpha: 1.0)
    }
}
