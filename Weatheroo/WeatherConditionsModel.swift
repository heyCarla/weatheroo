//
//  WeatherConditionsModel.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

import Foundation

struct WeatherConditions {
    
    let city: Location
    let actualTemp: String
    let iconName: String
    let description: String
    let feelsLikeTemp: String
    let precipitation: String
    
    init(city: Location, actualTemp: String, iconName: String, description: String, feelsLikeTemp: String, precipitation: String) {
        
        self.city           = city
        self.actualTemp     = actualTemp
        self.iconName       = iconName
        self.description    = description
        self.feelsLikeTemp  = feelsLikeTemp
        self.precipitation  = precipitation
    }
    
    // TODO: weather conditions include the following:
    // * Temperature in Celcius
    // * Weather Icon
    // * Weather description
    // * Feels like temperature in Celcius
    // * Precipitation
}
