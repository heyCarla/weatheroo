//
//  WeatherooModelFactoryTests.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-23.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import XCTest
@testable import Weatheroo

class WeatherooModelFactoryTests: XCTestCase {
    
    func testWeatherConditionsModelFactory() {
        
        let validDict   = [
            "temp_C": "25",
            "FeelsLikeC": "30",
            "precipMM": "0.0",
            "weatherDesc": [["value": "Hot hot hot"]],
            "weatherIconUrl": [["value": "https://www.google.com.au/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"]],
            "humidity": "70",
            "windspeedKmph": "5",
            "pressure": "50"
        ]
        
        let invalidDict = ["wrongKeys": ""]
        
        let modelFactory = WeatherConditionsModelFactory()
        let validWeatherConditionsModel = modelFactory.weatherConditionsModelDataForLocation(City.Sydney, data: validDict)
        let invalidWeatherConditionsModel = modelFactory.weatherConditionsModelDataForLocation(City.Sydney, data: invalidDict)

        XCTAssert(validWeatherConditionsModel != nil, "data with valid keys is successful")
        XCTAssert(invalidWeatherConditionsModel == nil, "data with invalid keys is unsuccessful")
    }
}