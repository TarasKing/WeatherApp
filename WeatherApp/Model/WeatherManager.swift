//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Taras on 10/02/2023.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithEror(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid={API_KEY}&units=metric"
//    let weatherCondition: String = "xmark.icloud"
    
    var delegate: WeatherManagerDelegate?
    
    
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1 Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2 Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3 Give the session a task
            //            with: url, completionHandler: handle(data: response: error:)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithEror(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4 Start the task
            task.resume()
        }
        
    }
    
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let pressure = decodedData.main.pressure
            let humidity = decodedData.main.humidity
            let speed = decodedData.wind.speed
            let id = decodedData.weather[0].id
            
            let weatherData = WeatherModel(conditionID: id, cityName: name, cityTemperature: temp, cityPressure: pressure, cityHumidity: humidity, windSpeed: speed)
            return weatherData
            
//            print(weatherData.conditionName)
//            print(weatherData.temperatureString)
        }catch {
            delegate?.didFailWithEror(error: error)
            return nil
        }
    }
    
    
   
    
}
