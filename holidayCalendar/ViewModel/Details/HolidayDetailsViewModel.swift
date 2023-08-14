//
//  HolidayDetailsViewModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation

class HolidayDetailsViewModel {
    private var holiday:HolidayModel
    
    init(holiday:HolidayModel) {
        self.holiday = holiday
    }
    
    public var getName:String {
        return "Nome local: " + self.holiday.localName
    }
    
    public var getInternationalName:String {
        return "Nome internacional: " + self.holiday.name
    }
    
    public var getDate:String {
        return "Data: " + self.holiday.date
    }
    
    public var getStatus:String {
        return "Data: " + self.holiday.date
    }
    
    public var getType:String {
        switch self.holiday.types[0] {
        case .bank:
            return "Facultativo: " + "Sim, exceto para bancos"
        case .typeOptional:
            return "Facultativo: " + "Sim, para todos"
        case .typePublic:
            return "Facultativo: " + "Não, obrigatorio"
        }
    }
    
    public var getGobal:String {
        let isGlobal = self.holiday.global
        return "Global: " + (isGlobal ? "Sim" : "Não")
    }
    public var getFixed:String {
        let isFixed = self.holiday.fixed
        return "Data fixa: " + (isFixed ? "Sim" : "Não")
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd/MM/yy"
            return newDateFormatter.string(from: date)
        }
        return "00/00/00"
    }

}
