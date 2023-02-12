//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Taras on 10/02/2023.
//

import Foundation


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={APIKEY}&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1 Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2 Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3 Give the session a task
            //            with: url, completionHandler: handle(data: response: error:)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4 Start the task
            task.resume()
        }
        
    }
    
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let pressure = decodedData.main.pressure
            let humidity = decodedData.main.humidity
            let speed = decodedData.wind.speed
            let id = decodedData.weather[0].id
            getConditionName(weatherID: id)
        }catch {
            print(error)
        }
    }
    
    
    func getConditionName(weatherID: Int) -> String {
        switch weatherID {
        case  0...232:
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
