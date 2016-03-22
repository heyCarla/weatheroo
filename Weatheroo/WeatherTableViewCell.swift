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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithWeatherData(weatherConditions: WeatherConditions?, city: City) {
        imageRequestTask?.cancel()
        
        cityLabel.text          = city.rawValue
        actualTempLabel.text    = "\(weatherConditions?.actualTemp)\u{00B0} C"
        descriptionLabel.text   = "\(weatherConditions?.description)"
        feelsLikeLabel.text     = "Feels like \(weatherConditions?.feelsLikeTemp)\u{00B0} C"
        precipitationLabel.text = "Prec. \(weatherConditions?.precipitation)mm"
        humidityLabel.text      = "\(weatherConditions?.humidityAsPercent)"
        windSpeedLabel.text     = "\(weatherConditions?.windSpeedInKm)km"
        pressureLabel.text      = "\(weatherConditions?.barometricPressure)"
        
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
        
        cityLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 25)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(cityLabel)
        
        actualTempLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        actualTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(actualTempLabel)
        
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 19)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(descriptionLabel)
        
        feelsLikeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(feelsLikeLabel)

        precipitationLabel.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(precipitationLabel)
    }
    
    func showAdditionalInfoLabels() {
        
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(humidityLabel)
        
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(pressureLabel)
        
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(windSpeedLabel)
    }
    
    private func displayWeatherIcon() {
        
        weatherIcon.backgroundColor                             = .blueColor()
        weatherIcon.translatesAutoresizingMaskIntoConstraints   = false
        self.contentView.addSubview(weatherIcon)
    }
    
    private func setCellLayoutConstraints() {
        
        // set autolayout constraints
        let uiElementsDict = [
            "icon": weatherIcon,
            "city": cityLabel,
            "tempInC": actualTempLabel,
            "description": descriptionLabel,
            "feelsLike": feelsLikeLabel,
            "precipitation": precipitationLabel,
            "humidity": humidityLabel,
            "pressure": pressureLabel,
            "wind": windSpeedLabel
        ]
        
        // vertical
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[icon(50)]", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[city(20)]-[tempInC(30)]-|", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[city(20)]-[description(20)]-[feelsLike(12)]-|", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[city(20)]-[description(20)]-[precipitation(12)]-|", options: [], metrics: nil, views: uiElementsDict))

        // horizontal
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[icon(50)]-[city]-|", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[icon(50)]-[tempInC(80)]-[description]-|", options: [], metrics: nil, views: uiElementsDict))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[icon(50)]-[tempInC(80)]-[feelsLike(80)]-[precipitation]-|", options: [], metrics: nil, views: uiElementsDict))
    }
    
}