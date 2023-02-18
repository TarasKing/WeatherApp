//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Taras on 11/02/2023.
//

import Foundation


// Codable is used when Decodable and Encodable

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
        
    struct Main: Codable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }
    struct Wind: Codable {
        let speed: Double
    }
    struct Weather: Codable {
        let id: Int
    }

//    weather[0].description
//    main.temp
}

