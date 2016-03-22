//
//  LocationModelFactory.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

struct LocationModelFactory {
    
    func getWeatherDataForLocation(location: LocationName.RawValue) {
        
        var weatherDatasource = WeatherDatasource()
        weatherDatasource.makeWeatherDataRequest(location) { currentData in
            
            let currentData = currentData
            print(currentData)
            
            // TODO: set data in LocationModel
            
            
        }

    }
}