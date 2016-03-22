//
//  WeatherViewController.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-21.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let weatherFactory = WeatherConditionsModelFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayWeatherTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UI Elements
    
    private func displayWeatherTableView() {
        
        let tableView = WeatherTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView":tableView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[tableView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["tableView":tableView]))

        
        City.allValues.forEach { city in
            weatherFactory.weatherDataForLocation(city, completion: { conditions in
                
                tableView.updateWithCity(city, data: conditions)
            })
        }
    }
}

