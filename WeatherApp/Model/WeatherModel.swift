//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Taras on 16/02/2023.
//

import Foundation



struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let cityTemperature: Double
    let cityPressure: Int
    let cityHumidity: Int
    let windSpeed: Double
    
    
    var temperatureString: String {


        return String(format: "%.1f", cityTemperature)
//other option is
//        return String(floor(cityTemperature * 10)/10)
    }
    
    var conditionName: String{
        switch conditionID {
        case  200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.rain"
        case 500...504:
            return "cloud.sun.rain"
        case 511:
            return "snowflake"
        case 520...531:
            return "cloud.bolt.rain"
        case 600...622:
            return "snowflake"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801:
            return "cloud.sun"
        case 802...804:
            return "cloud"
        default:
            return "xmark.icloud"
        }
    }
    
    
    
}
