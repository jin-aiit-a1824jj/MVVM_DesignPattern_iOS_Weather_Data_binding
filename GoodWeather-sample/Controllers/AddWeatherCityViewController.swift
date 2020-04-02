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
        
    }
    
    @IBAction func cloes(){
        self.dismiss(animated: true, completion: nil)
    }
}
