//
//  WeatherListTableViewController.swift
//  GoodWeather-sample
//
//  Created by JONGWOO JIN on 2020/04/02.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm.name)
        
        self.weatherListViewModel.addWEatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }else if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
       
    }
    
    private var weatherListViewModel = WeatherListViewModel()
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav =  segue.destination as? UINavigationController else {
                   fatalError("UINavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
                   fatalError("AddWeatherCityViewController not found")
        }
        addWeatherCityVC.delegate = self
        
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav =  segue.destination as? UINavigationController else {
                   fatalError("UINavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
                   fatalError("SettingsTableViewController not found")
        }
        settingsTVC.delegate = self
    }
    
}

extension WeatherListTableViewController : SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        print(vm as Any)
        
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
}
