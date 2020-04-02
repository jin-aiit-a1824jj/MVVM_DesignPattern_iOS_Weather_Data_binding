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
    
}
