//
//  SettingsViewModel.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

enum Unit : String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
                case .celsius:
                    return "Calsius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
}


struct SettingsViewModel {
    
    let units = Unit.allCases
    
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefautls = UserDefaults.standard
            if let value = userDefautls.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        } set {
            let userDefautls = UserDefaults.standard
            userDefautls.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
