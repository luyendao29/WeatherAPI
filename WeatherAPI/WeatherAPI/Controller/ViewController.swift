//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var totalDataWeather: Weather?
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
//    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var last_updatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataFromAPI()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDataFromAPI() {
        DataService.shared.getInfoUser { data in
            self.totalDataWeather = data
            self.display()
            self.tableview.reloadData()
        }
    }
    
    func display() {
        nameLabel.text = (totalDataWeather?.location.name)! + " - " + (totalDataWeather?.location.country)!
        //countryLabel.text = totalDataWeather?.location.country
        last_updatedLabel.text = "Last update: " + (totalDataWeather?.current.last_updated)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if totalDataWeather?.forecast.forecastday.count == nil {
            return 0
        } else {
            return (totalDataWeather?.forecast.forecastday.count)!
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.date_epochLabel.text = totalDataWeather?.forecast.forecastday[indexPath.row].date_epoch.getDaysOfWeek()
        cell.maxwind_kphLabel.text = String(Int((totalDataWeather?.forecast.forecastday[indexPath.row].day.maxwind_kph)!)) + " kph"
        cell.avgtemp_fLabel.text = String(Int((totalDataWeather?.forecast.forecastday[indexPath.row].day.avgtemp_f)!)) + " %"
        cell.temp_cLabel.text = String(Int((totalDataWeather?.forecast.forecastday[indexPath.row].day.mintemp_c)!)) + " - " + String(Int((totalDataWeather?.forecast.forecastday[indexPath.row].day.maxtemp_c)!)) + " º C"
        cell.iconImage.imageUrlString(urlString: (totalDataWeather?.forecast.forecastday[indexPath.row].day.condition.icon)!, indexpath: indexPath)
        return cell
    }
    
    
}
