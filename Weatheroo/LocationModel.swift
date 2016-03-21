//
//  LocationModel.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

enum Location: String {
    
    case Sydney     = "Sydney"
    case Melbourne  = "Melbourne"
    case Brisbane   = "Brisbane"
    case Adelaide   = "Adelaide"
    case Perth      = "Perth"
    case Hobart     = "Hobart"
    case Darwin     = "Darwin"
    
    static let allValues: [Location] = [.Sydney, .Melbourne, .Brisbane, .Adelaide, .Perth, .Hobart, .Darwin]
}

struct Locations {
    
    var isFavourited: Bool
    
    func extendedLocationInformation() {
        
        // TODO:
        // * Humidity as a %
        // * Wind speed in km / h
        // * Barometric pressure
    }
}
