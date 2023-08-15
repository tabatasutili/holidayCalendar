//
//  AlertManager.swift
//  holidayCalendar
//
//  Created by Sabrina on 15/08/23.
//

import Foundation
import UIKit

class AlertManager {
    
    func showAlert(title: String, message: String, goBack:Bool, navigationController: UINavigationController) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { _ in
            if goBack {
                self.backToSearchScreen(navigationController: navigationController)
            }
            
        }
        alertController.addAction(okAction)
        navigationController.present(alertController, animated: true, completion: nil)
        
    }
    
    func backToSearchScreen(navigationController: UINavigationController) {
        navigationController.viewControllers.removeLast()
    }

}
