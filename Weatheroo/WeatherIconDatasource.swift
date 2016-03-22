//
//  WeatherIconDatasource.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-23.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation
import UIKit

struct WeatherIconDatasource {
    
    static func imageWithURL(imageURL: NSURL, completion: (UIImage?) -> Void) -> NSURLSessionDownloadTask {
    
        let downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(imageURL) { (dataLocation, response, error) in
            
            guard let dataLocation = dataLocation,
                imageData = NSData(contentsOfURL: dataLocation),
                image = UIImage(data: imageData) else {
                
                dispatch_async(dispatch_get_main_queue(), {
                    completion(nil)
                })
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                completion(image)
            })
        }
        
        downloadTask.resume()
        
        return downloadTask
    }
}