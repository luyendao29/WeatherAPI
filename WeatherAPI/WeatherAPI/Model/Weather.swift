//
//  Forecastday.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit


struct Weather : Codable {
    
    var location: Location
    var current: Current
    var forecast: Forecast

    struct Location : Codable {
        var name: String
        var country: String
    }

    struct Current : Codable {
        var last_updated: String
    }
    
    struct Forecast : Codable {
        var forecastday: [Forecastday]
        
        struct Forecastday : Codable {
            var date_epoch: TimeInterval
            var day: Day
            
            struct Day : Codable {
                var avgtemp_f: Double
                var maxtemp_c: Double
                var mintemp_c: Double
                var maxwind_kph: Double
                var condition: Condition
                    
                struct Condition: Codable {
                    var icon: String
                }
            }
        
            
        }
    }
}

