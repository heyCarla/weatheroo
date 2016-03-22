//
//  WeatherConditionsModel.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

struct WeatherConditions {
    
    let city: City
    let actualTemp: String
    let description: String
    let feelsLikeTemp: String
    let precipitation: String
    let iconURL: String
    let humidityAsPercent: String
    let windSpeedInKm: String
    let barometricPressure: String
    
    init(city: City, actualTemp: String, description: String, feelsLikeTemp: String, precipitation: String, iconURL: String, humidity: String, windSpeed: String, pressure: String) {
        
        self.city               = city
        self.actualTemp         = actualTemp
        self.description        = description
        self.feelsLikeTemp      = feelsLikeTemp
        self.precipitation      = precipitation
        self.iconURL            = iconURL
        self.humidityAsPercent  = humidity
        self.windSpeedInKm      = windSpeed
        self.barometricPressure = pressure
    }
}
