//
//  RequestError.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//
import Foundation

enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
