//
//  WeatherDatasource.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

typealias WeatherJSONParsingCompletion  = (currentData: [String:AnyObject]?) -> Void

struct WeatherDatasource {
    

    // TODO: make/refresh request every 10 minutes
    
    func makeWeatherDataRequest(location: City, completion: WeatherJSONParsingCompletion) {
        
        let url         = "http://api.worldweatheronline.com/free/v2/weather.ashx"
        let apiKey      = "5ed0d8b647f24d81a9f105723161603"
        let endpoint    = "\(url)" + "?key=\(apiKey)" + "&q=\(location.rawValue)" + "&num_of_days=1" + "&format=json"
        
        // set up the request
        let request         = NSMutableURLRequest(URL: NSURL(string: endpoint)!)
        request.HTTPMethod  = "GET"
        
        let session     = NSURLSession(configuration: .defaultSessionConfiguration())
        let dataTask    = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
          
            guard let data = data where error == nil else {
                
                print("no data -- fail")
                dispatch_async(dispatch_get_main_queue(), {
                    completion(currentData: nil)
                })
                return
            }
            
            let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [String: AnyObject]
            
            if let jsonData = json, currentWeatherModel = self.currentWeatherConditionsFromJSON(jsonData) {
                dispatch_async(dispatch_get_main_queue(), {
                    completion(currentData: currentWeatherModel)
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    completion(currentData: nil)
                })
            }

            // TODO: cache the response
        }
        
        dataTask.resume()
        
    }
    
    
    // MARK: JSON Parsing Method(s)
    
    func currentWeatherConditionsFromJSON(json: [String:AnyObject]) -> [String:AnyObject]? {
        
        guard let currentConditions = json["data"]?["current_condition"] as? [[String:AnyObject]], currentDict = currentConditions.first else {
            print("failure!!")
            return nil
        }
        
        return currentDict
    }
}