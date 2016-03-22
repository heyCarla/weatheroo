//
//  WeatherDatasource.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation

enum WeatherDatasourceError: ErrorType {
    
    // TODO: add NSError failure types and implement
}

enum ResultType {
    case Success(result: String)
    case Failure(result: String)
}

typealias WeatherDataCompletion = (result: ResultType) -> Void
typealias WeatherJSONParsingCompletion  = (currentData: [String:AnyObject]) -> Void

struct WeatherDatasource {
    

    // TODO: make/refresh request every 10 minutes
    
    mutating func makeWeatherDataRequest(location: String, completion: WeatherJSONParsingCompletion) { //-> [String:AnyObject]? {
        
        let url     = "http://api.worldweatheronline.com/free/v2/weather.ashx"
        let apiKey  = "5ed0d8b647f24d81a9f105723161603"
        
        // TODO: grab location from LocationMode so this string biz isn't necessary ////////
        // required params:
        // q = location
        // num_of_days = number of days
        // key = api key

        let endpoint = "\(url)" + "?key=\(apiKey)" + "&q=\(location)" + "&num_of_days=1" + "&format=json"
        //print(endpoint)
        
        ///////////////////////////////////////////////////////////////////////////////////
        
        // set up the request
        let request         = NSMutableURLRequest(URL: NSURL(string: endpoint)!)
        request.HTTPMethod  = "GET"
        
        let session     = NSURLSession(configuration: .defaultSessionConfiguration())
        let dataTask    = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            guard let data = data where error == nil else {
                
                print("no data -- fail")
                // TODO: handle error
                
                return
            }
            
            let json: [String:AnyObject]
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [String: AnyObject]
                
                let currentWeatherData = self.currentWeatherConditionsFromJSON(json)
                completion(currentData: currentWeatherData)
                //print(currentWeatherData)
                
            } catch let exception {
                fatalError("didn't work")
                
                // TODO: handle error (invalid json?)
            }
            
            // TODO: cache the response
        }
        
        dataTask.resume()
    }
    
    
    // MARK: JSON Parsing Method(s)
    
    func currentWeatherConditionsFromJSON(json: [String:AnyObject]) -> [String:AnyObject] {
        
        let currentConditions = json["data"]!["current_condition"]!![0] as! [String:AnyObject]
        return currentConditions
    }
}