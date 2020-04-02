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
        setupVMBindings()
    }
    
    private func setupVMBindings(){

        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind{ self.cityNameLabel.text = $0}
            weatherVM.currentTemperature.temperature.bind{ self.currnetTemperatureLabel.text = $0.formatAsDegree}
            weatherVM.currentTemperature.temperatureMax.bind{ self.maxTempLabel.text = $0.formatAsDegree}
            weatherVM.currentTemperature.temperatureMin.bind{ self.minTempLabel.text = $0.formatAsDegree}
        }

        // change value
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.weatherViewModel?.name.value = "Chanage Value after 2 sec"
        }
    }
    
}
