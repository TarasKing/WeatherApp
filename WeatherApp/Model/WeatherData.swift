//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Taras on 11/02/2023.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
        
    struct Main: Decodable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }
    struct Wind: Decodable {
        let speed: Double
    }
    struct Weather: Decodable {
        let id: Int
    }

//    weather[0].description
//    main.temp
}

