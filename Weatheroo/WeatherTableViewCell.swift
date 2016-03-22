//
//  WeatherTableViewCell.swift
//  Weatheroo
//
//  Created by Carla Alexander on 2016-03-22.
//  Copyright © 2016 MagicNoodles. All rights reserved.
//

import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    private let weatherIcon         = UIImageView()
    private let cityLabel           = UILabel()
    private let actualTempLabel     = UILabel()
    private let descriptionLabel    = UILabel()
    private let feelsLikeLabel      = UILabel()
    private let precipitationLabel  = UILabel()
    private let windSpeedLabel      = UILabel()
    private let humidityLabel       = UILabel()
    private let pressureLabel       = UILabel()
    
    private var imageRequestTask: NSURLSessionDownloadTask?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        displayWeatherIcon()
        displayCellLabels()
        setCellLayoutConstraints()
    }
    
//    override func upd
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateWithWeatherData(weatherConditions: WeatherConditions?, city: City) {
        imageRequestTask?.cancel()
        
        
        cityLabel.text          = city.rawValue
        actualTempLabel.text    = weatherConditions?.actualTemp
        descriptionLabel.text   = weatherConditions?.description
        feelsLikeLabel.text     = weatherConditions?.feelsLikeTemp
        precipitationLabel.text = weatherConditions?.precipitation
        humidityLabel.text      = weatherConditions?.humidityAsPercent
        windSpeedLabel.text     = weatherConditions?.windSpeedInKm
        pressureLabel.text      = weatherConditions?.barometricPressure
        
        if let iconURL = weatherConditions?.iconURL, imageURL = NSURL(string: iconURL) {
            print("iconURL is \(iconURL)")
            imageRequestTask = WeatherIconDatasource.imageWithURL(imageURL, completion: { image in
                self.weatherIcon.image = image
            })
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageRequestTask?.cancel()
    }
    
    // MARK: Cell Layout Methods
    
    private func displayCellLabels() {
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(cityLabel)
        
//        actualTempLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(actualTempLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(descriptionLabel)
    }
    
    private func displayWeatherIcon() {
        
        weatherIcon.backgroundColor = .blueColor()
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(weatherIcon)
        
    }
    
    private func setCellLayoutConstraints() {
        
        // set autolayout constraints
        let uiElementsDict = [
            "icon": weatherIcon,
            "city": cityLabel,
            "tempC": actualTempLabel,
            "description": descriptionLabel
        ]
        
//        self.contentView.addConstraint(NSLayoutConstraint(item: weatherIcon, attribute: .Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
//
//        self.contentView.addConstraint(NSLayoutConstraint(item: cityLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: weatherIcon, attribute: NSLayoutAttribute.Right, multiplier: 0.25, constant: 0.0))
////
////        self.contentView.addConstraint(NSLayoutConstraint(item: cityLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[icon(100)]", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[city]-[description]-|", options: [], metrics: nil, views: uiElementsDict))

//        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[tempC]-|", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[icon(100)]-[city]-|", options: [], metrics: nil, views: uiElementsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[description]-[tempC]-|", options: [], metrics: nil, views: uiElementsDict))
    }
    
}