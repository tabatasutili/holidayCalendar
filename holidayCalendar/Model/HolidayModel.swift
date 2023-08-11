//
//  HolidayModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation

// MARK: - Holiday
struct HolidayModel: Codable {
    let date, localName, name: String
    let countryCode: CountryCode
    let fixed, global: Bool
    let counties: [String]?
    let launchYear: JSONNull?
    let types: [TypeElement]
}

enum CountryCode: String, Codable {
    case br = "BR"
}

enum TypeElement: String, Codable {
    case bank = "Bank"
    case typeOptional = "Optional"
    case typePublic = "Public"
}

typealias Holidays = [HolidayModel]

