//
//  WeatherCell.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = vm.name.value
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.value.formatAsDegree)"
    }
    
}
