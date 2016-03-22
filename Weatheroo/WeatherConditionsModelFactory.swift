//
//  WeatherConditionsModelFactory.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

typealias WeatherConditionsParsingCompletion = (conditions: WeatherConditions?) -> Void

struct WeatherConditionsModelFactory {
    
    func weatherDataForLocation(location: City, completion: WeatherConditionsParsingCompletion) {
        
        let weatherDatasource = WeatherDatasource()
        weatherDatasource.makeWeatherDataRequest(location) { currentData in
            
            let currentData = currentData
            let weatherConditions  = self.weatherConditionsModelDataForLocation(location, data: currentData)
            completion(conditions: weatherConditions)
        }
    }
    
    @warn_unused_result
    private func weatherConditionsModelDataForLocation(location: City, data: [String: AnyObject]) -> WeatherConditions? {
        
        guard let actualTemp = data["temp_C"] as? String,
            feelsLike = data["FeelsLikeC"] as? String,
            precipitation = data["precipMM"] as? String,
            descriptionData = data["weatherDesc"] as? [[String:AnyObject]],
            description = descriptionData.first?["value"] as? String,
            iconData = data["weatherIconUrl"] as? [[String:AnyObject]],
            iconURL = iconData.first?["value"] as? String,
            humidity = data["humidity"] as? String,
            windSpeed = data["windspeedKmph"] as? String,
            pressure = data["pressure"] as? String
        
        else {
          
            print("something went wrong")
            // TODO: handle error here
                return nil
        }
        
        return WeatherConditions(city: location, actualTemp: actualTemp, description: description, feelsLikeTemp: feelsLike, precipitation: precipitation, iconURL: iconURL, humidity: humidity, windSpeed: windSpeed, pressure: pressure)
    }
}