//
//  WeatherooDatasourceTests.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-23.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import XCTest
@testable import Weatheroo

class WeatherooDatasourceTests: XCTestCase {
    
    func testWeatherDatasource() {
        
        let expectation = expectationWithDescription("weatherConditions completion")
        waitForExpectationsWithTimeout(5, handler: nil)
        
        let weatherFactory = WeatherConditionsModelFactory()
        weatherFactory.weatherDataForLocation(City.Sydney, completion: { conditions in
            
            if let _ = conditions {
                expectation.fulfill()
            } else {
                XCTFail()
            }
            
        })
    }
    
    func testWeatherIconDatasource() {
        
        let expectation = expectationWithDescription("image completion")
        waitForExpectationsWithTimeout(5, handler: nil)

        let googleLogoImageURL = "https://www.google.com.au/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
        WeatherIconDatasource.imageWithURL(NSURL(string: googleLogoImageURL)!) { (image) -> Void in
            if let _ = image {
                expectation.fulfill()
            } else {
                XCTFail()
            }
        }
    }
    
}