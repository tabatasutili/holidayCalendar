//
//  ListHolidaysViewModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation

protocol viewModelDelegate: NSObject {
     func reloadTableView()
}
class ListHolidaysViewModel {
    
    private let service = ServiceManager()
    private var holidayList: Holidays = []
    private var country: String
    private var year: String
    private weak var delegate:viewModelDelegate?
    
    
    init(country: String, year: String) {
        self.country = country
        self.year = year
        self.fetchHolidays()
    }
    
    private func fetchHolidays() {
        let urlConcatenetion = "https://date.nager.at/api/v3/PublicHolidays/"+year+"/"+country
        guard let url = URL(string: urlConcatenetion) else { return }
        let urlRequest = URLRequest(url: url)
        service.fetch(url: urlRequest, completion: { (result: Result<Holidays, Error>) in
            switch result {
            case .success(let sucess):
                print("\(sucess)")
                self.appendList(holidays: sucess)
            case .failure(let error):
                 print("Erro na chamas\(error)")
            }
        })
        
    }
    
    private func appendList(holidays: Holidays) {
        holidayList = holidays
        DispatchQueue.main.async {
            self.delegate?.reloadTableView()
          }
        }
    
    public func delegate(delegate:viewModelDelegate?) {
           self.delegate = delegate
       }
    
    public var numbOfRows:Int {
        return self.holidayList.count 
        }
    
    public func currentHoliday(indexPath: IndexPath) -> HolidayModel {
            return self.holidayList[indexPath.row]
        }
    
    public func getHolidayList() -> Holidays {
        return holidayList
        }
    
    public var getCountry:String {
        return self.country
        }
    
    public var getYear:String {
        return self.year
        }
    
}
