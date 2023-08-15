//
//  HolidayDetailsViewModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation

class HolidayDetailsViewModel {
    private var holiday:HolidayModel
    private var detailsList: [String] = []
    
    init(holiday:HolidayModel) {
        self.holiday = holiday
        self.appendDetailsList()
    }
    
    private func appendDetailsList() {
        detailsList.append(getName)
        detailsList.append(getInternationalName)
        detailsList.append(getDate)
        detailsList.append(getType)
        detailsList.append(getGobal)
        detailsList.append(getFixed)
        
    }
    
    public var getName:String {
        return Constants.localNameTitle + self.holiday.localName
    }
    
    public var getInternationalName:String {
        return Constants.internationalNameTitle + self.holiday.name
    }
    
    public var getDate:String {
        return Constants.dateTitle + self.holiday.date
    }
    
    public var getType:String {
        switch self.holiday.types[0] {
        case .bank:
            return Constants.typeTitle + Constants.bank
        case .typeOptional:
            return Constants.typeTitle + Constants.yes
        case .typePublic:
            return Constants.typeTitle + Constants.no
        }
    }
    
    public var getGobal:String {
        let isGlobal = self.holiday.global
        return Constants.globalTitle + (isGlobal ? Constants.yes : Constants.no)
    }
    public var getFixed:String {
        let isFixed = self.holiday.fixed
        return Constants.fixedTitle + (isFixed ? Constants.yes : Constants.no)
    }
    
    public var numbOfRows:Int {
        return detailsList.count
    }
    
    public func currentDetail(indexPath: IndexPath) -> String {
            return self.detailsList[indexPath.row]
        }
    
}
