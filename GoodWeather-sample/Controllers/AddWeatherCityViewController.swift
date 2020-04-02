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
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1e0e41ff074fffaec6203c72bea90f74")!
            
            let weatherResource = Resource<Any>(url: weatherURL){ data in
                return data
            }
            
            Webservice().load(resource: weatherResource){ result in
                
            }
            
        }
    }
    
    @IBAction func cloes(){
        self.dismiss(animated: true, completion: nil)
    }
}
