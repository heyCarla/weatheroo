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

struct WeatherDatasource {
    
    // TODO: make/refresh request every 10 minutes
    
    func makeNetworkRequestWithData() {
    //makeNetworkRequestWithData(requestData: [String: String])
        
        let url     = "http://api.worldweatheronline.com/free/v2/weather.ashx"
        let apiKey  = "5ed0d8b647f24d81a9f105723161603"
        
        // TODO: grab location from LocationMode so this string biz isn't necessary ////////
        // required params:
        // q = location
        // num_of_days = number of days
        // key = api key
        
        let location = "Sydney"

        let endpoint = "\(url)" + "?key=\(apiKey)" + "&q=\(location)" + "&num_of_days=1" + "&format=json"
        //print(endpoint)
        
        ///////////////////////////////////////////////////////////////////////////////////
        

        // set up the request
        let request         = NSMutableURLRequest(URL: NSURL(string: endpoint)!) //TODO: remove (!) when unwrapped
        request.HTTPMethod  = "GET"
        
        let session     = NSURLSession(configuration: .defaultSessionConfiguration())
        let dataTask    = session.dataTaskWithRequest(request)  { (data, response, error) -> Void in
            
            guard let data = data where error == nil else {
                
                print("no data -- fail")
                // TODO: handle error
                
                return
            }
            
            let json: [String:AnyObject]
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [String : AnyObject]
            } catch let exception {
                fatalError("didn't work")
                
                // TODO: handle error (invalid json?)
            }

            
            // TODO: cache the response

            
            print(json)
        }
        
        dataTask.resume()
    }
}