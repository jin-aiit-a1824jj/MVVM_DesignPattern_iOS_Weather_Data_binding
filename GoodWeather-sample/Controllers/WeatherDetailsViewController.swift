//
//  WeatherDetailsViewController.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currnetTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = self.weatherViewModel {
            self.cityNameLabel.text = weatherVM.name.value
            self.currnetTemperatureLabel.text =  "\(weatherVM.currentTemperature.temperature.value.formatAsDegree)"
            self.maxTempLabel.text = "\(weatherVM.currentTemperature.temperatureMax.value.formatAsDegree)"
            self.minTempLabel.text = "\(weatherVM.currentTemperature.temperatureMin.value.formatAsDegree)"
        }
        
    }
    
}
