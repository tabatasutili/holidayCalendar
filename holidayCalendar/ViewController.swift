
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
        
        let viewcontroller = SearchHolidaysViewController()
        
        present(viewcontroller, animated: true, completion: nil)
        
    }
    
    
}



