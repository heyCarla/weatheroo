//
//  LocationModelFactory.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

struct LocationModelFactory {
    
    func getWeatherDataForLocation(location: LocationName) {
        
        var weatherDatasource = WeatherDatasource()
        weatherDatasource.makeWeatherDataRequest(location.rawValue) { currentData in
            
            let currentData = currentData
            print(currentData)
        }

    }
}