//
//  WeatherTableView.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-22.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation
import UIKit

final class WeatherTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let cellReuseIdentifier = "cell"
    private var weatherData = [(city: City, data: WeatherConditions?)]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: .Plain)
        
        weatherData.reserveCapacity(City.allValues.count)
        self.delegate   = self
        self.dataSource = self
        self.registerClass(WeatherTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        estimatedRowHeight = 150
        rowHeight = UITableViewAutomaticDimension
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithCity(city: City, data: WeatherConditions?) {
    
        
        
        self.beginUpdates()
        weatherData.append((city, data))
        let indexToInsert = NSIndexPath(forRow: weatherData.endIndex - 1, inSection: 0)
        self.insertRowsAtIndexPaths([indexToInsert], withRowAnimation: .Automatic)
        self.endUpdates()
    }
    
    
    // MARK: UITableViewDataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:WeatherTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! WeatherTableViewCell
        
        NSLog("cell for row \(indexPath.row)")

        // TODO: check NSUserDefaults to see if city exists in favourites array & update if necessary
        
        // set cell data
        let cellWeatherTuple = weatherData[indexPath.row]
        cell.updateWithWeatherData(cellWeatherTuple.data, city: cellWeatherTuple.city)
        
        return cell
    }
    
    
    // MARK: UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("tapped cell number: \(indexPath.row)")
    }
}