
//
//  ViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 10/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://date.nager.at/api/v3/PublicHolidays/2023/BR")
        let urlRequest = URLRequest(url: url!)
        let viewcontroller = SearchHolidaysViewController()
        
        present(viewcontroller, animated: true, completion: nil)
//        fetch(url: urlRequest, completion: { (result: Result<Holidays, Error>) in
//            switch result {
//            case .success(let sucess):
//                print("\(sucess)")
//            case .failure(let error):
//                 print("Erroooo na chamas\(error)")
//            }
//        })
        
    }
    
    
}


enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}


