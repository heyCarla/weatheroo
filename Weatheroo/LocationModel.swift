//
//  LocationModel.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

enum LocationName: String {
    
    case Sydney     = "Sydney"
    case Melbourne  = "Melbourne"
    case Brisbane   = "Brisbane"
    case Adelaide   = "Adelaide"
    case Perth      = "Perth"
    case Hobart     = "Hobart"
    case Darwin     = "Darwin"
    
    static let allValues: [LocationName] = [.Sydney, .Melbourne, .Brisbane, .Adelaide, .Perth, .Hobart, .Darwin]
}

struct Location {
    
    var name: LocationName
    var isFavourite: Bool
    let humidityAsPercent: Int
    let windSpeedInKm: Int
    let barometricPressure: Int
    
    init(name: LocationName, isFavourite: Bool, humidity: Int, windSpeed: Int, pressure: Int) {
     
        self.name               = name
        self.isFavourite        = isFavourite
        self.humidityAsPercent  = humidity
        self.windSpeedInKm      = windSpeed
        self.barometricPressure = pressure
    }
    
    mutating func updateFavouriteState() {
        
        // set location as user favourite if not already set
        if self.isFavourite == true {
            self.isFavourite = false
        } else {
            self.isFavourite = true
        }
    }
}
