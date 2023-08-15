//
//  SearchHolidaysViewModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 14/08/23.
//

import Foundation

class SearchHolidaysViewModel {
    
    private var years: [Int] = []
    private var countrys: Countrys = []
    private let service = ServiceManager()

    
    init() {
        setupYearsArray()
        fetchCountrys()
    }
    
    private func setupYearsArray() {
        for year in 2018...2028 {
            years.append(year)
        }
    }
    
    private func fetchCountrys() {
        let urlConcatenetion = Constants.apiUrlCountrys
        guard let url = URL(string: urlConcatenetion) else { return }
        let urlRequest = URLRequest(url: url)
        service.fetch(url: urlRequest, completion: { (result: Result<Countrys, Error>) in
            switch result {
            case .success(let sucess):
                self.appendList(countrys: sucess)
                
            case .failure(let error):
                print("Erro na chamada de países disponiveis\(error)")
//
            }
        })
        
    }
    
    private func appendList(countrys: Countrys) {
        self.countrys = countrys
    }
    
    public var getCountrysCount:Int {
        return countrys.count
    }
    
    public var getYearsCount:Int {
        return years.count
    }
    
    func getCountry(row: Int) -> String {
        return countrys[row].name
    }
    
    func getYear(row: Int) -> String {
        return String(years[row])
    }
    
    func getCountryCode(row: Int) -> String {
        return countrys[row].countryCode
    }
    
    
}
