//
//  UIImageView.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//
import UIKit
extension UIImageView {
    func imageUrlString(urlString: String, indexpath: IndexPath) {
        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            if let data = try?  Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                  
                }
            }
        }
    }
}
