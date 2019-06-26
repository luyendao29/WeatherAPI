//
//  TimeInterval.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import Foundation

extension TimeInterval {
    func getDaysOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "EN")
        
        let dayOfWeek = Date(timeIntervalSince1970: self)
        
        return dateFormatter.string(from: dayOfWeek)
    }
}
