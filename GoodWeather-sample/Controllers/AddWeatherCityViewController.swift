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
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind {
                self.addCityViewModel.city = $0
            }
        }
    }
    
    @IBAction func saveCityButtonPressed(){
        
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=APIKEY&units=imperial")!
            
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
    
    @IBOutlet weak var stateTextField: BindingTextField!{
        didSet {
            stateTextField.bind {
                self.addCityViewModel.state = $0
            }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField!{
        didSet {
            zipCodeTextField.bind {
                self.addCityViewModel.zipCode = $0
            }
        }
    }
    
    private var addCityViewModel = AddCityViewModel()
    
}

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}
