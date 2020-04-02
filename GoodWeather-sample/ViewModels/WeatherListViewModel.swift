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

struct WeatherViewModel {
    let name: String
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
}
