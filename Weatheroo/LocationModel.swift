//
//  LocationModel.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

enum City: String {
    
    case Sydney     = "Sydney"
    case Melbourne  = "Melbourne"
    case Brisbane   = "Brisbane"
    case Adelaide   = "Adelaide"
    case Perth      = "Perth"
    case Hobart     = "Hobart"
    case Darwin     = "Darwin"
    
    static let allValues: [City] = [.Sydney, .Melbourne, .Brisbane, .Adelaide, .Perth, .Hobart, .Darwin]
}

struct Location {
    
    var name: City
    var isFavourite: Bool
    
    init(name: City, isFavourite: Bool) {
     
        self.name               = name
        self.isFavourite        = isFavourite
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
