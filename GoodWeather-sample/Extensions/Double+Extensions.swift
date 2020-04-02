//
//  Double+Extensions.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
