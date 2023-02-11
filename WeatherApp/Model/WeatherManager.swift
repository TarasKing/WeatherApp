//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Taras on 10/02/2023.
//

import Foundation


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={api-KEY}&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
