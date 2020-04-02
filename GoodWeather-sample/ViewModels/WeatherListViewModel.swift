//
//  WeatherListViewModel.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWEatherViewModel(_ vm: WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    mutating func updateUnit(to unit: Unit){
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
    }
    
    mutating private func toCelsius(){
        weatherViewModels = weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * 5 / 9
            return weatherModel
        }
    }
    
    mutating private func toFahrenheit(){
        weatherViewModels = weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value  * 9 / 5) + 32
            return weatherModel
        }
    }
    
}

struct WeatherViewModel: Decodable {
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Dynamic<Double>
    let temperatureMin: Dynamic<Double>
    let temperatureMax: Dynamic<Double>
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
    }
}

// Type Eraser
class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener =  (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    func bind(listener: @escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T){
        self.value = value
    }
    
    private enum CodingKeys: CodingKey{
        case value
    }
}
