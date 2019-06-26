//
//  DataService.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class DataService {
    static var shared: DataService = DataService()
    
    func getInfoUser(completedHandle: @escaping(Weather) -> Void) {
        
        guard let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris&days=7") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let recivedData = try JSONDecoder().decode(Weather.self, from: data!)
                
                DispatchQueue.main.async {
                    completedHandle(recivedData)
                    print(recivedData)
                }
            } catch {
                print(error)
            }
        })
        
        downloadTask.resume()
        
    }
    
}

