//
//  WeatherListViewModel.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
}

struct WeatherViewModel: Decodable {
    let name: String
    let main: TemperatureViewModel
}

struct TemperatureViewModel: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
