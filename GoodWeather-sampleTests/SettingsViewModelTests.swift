//
//  SettingsViewModelTests.swift
//  GoodWeather-sampleTests
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import XCTest
@testable import GoodWeather_sample

class SettingsViewModelTests: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_shuould_make_sure_that_default_seleted_unit_is_fahrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        self.settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }

    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
