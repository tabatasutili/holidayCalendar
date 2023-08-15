//
//  HolidayCellViewModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation

class HolidayCellViewModel {
    
    private var holiday:HolidayModel
       
        
    init(holiday:HolidayModel) {
        self.holiday = holiday
    }
    
    public var getName:String {
        return self.holiday.localName
    }
    
    public var getDate:String {
        let formattedDate = formatDate(dateString: self.holiday.date)
        return formattedDate
    }
    
    func formatDate(dateString: String) -> String {
            let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormatOriginal
            if let date = dateFormatter.date(from: dateString) {
                let newDateFormatter = DateFormatter()
                newDateFormatter.dateFormat = Constants.dateFormated
                return newDateFormatter.string(from: date)
            }
            return Constants.dateDefault
        }
    
}
