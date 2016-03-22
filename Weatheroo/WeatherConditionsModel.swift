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
    
    var city: City
    var actualTemp: String
    var description: String
    var feelsLikeTemp: String
    var precipitation: String
    var iconURL: String
    var humidityAsPercent: String
    var windSpeedInKm: String
    var barometricPressure: String
    
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
