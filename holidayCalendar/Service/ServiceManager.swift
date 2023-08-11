//
//  ServiceManager.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation

class ServiceManager {
    
    func fetch<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else {
                print("Error accessing swapi.co: \(error)")
                return
            }

            let result = Result {
                try JSONDecoder().decode(T.self, from: data)
            }
            completion(result)
        }
        task.resume()
    }
}
