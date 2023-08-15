//
//  ExtensionsUILabel.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation
import UIKit

extension UILabel {
    func applyShadow(shadowColor: UIColor = UIColor.lightGray, shadowOffset: CGSize = CGSize(width: 1, height: 1), shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 4.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
}

