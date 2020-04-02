//
//  AddWeatherCityViewController.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1e0e41ff074fffaec6203c72bea90f74&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL){ data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource){ [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
        }
    }
    
    @IBAction func cloes(){
        self.dismiss(animated: true, completion: nil)
    }
    
    var delegate: AddWeatherDelegate?
}

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}
