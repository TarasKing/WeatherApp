//
//  ViewController.swift
//  WeatherApp
//
//  Created by Taras on 09/02/2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        weatherManager.delegate = self
        searchTextField.delegate = self
        

    }

    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
       print( searchTextField.text!)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.pressureLabel.text = weather.pressureString
            self.windSpeedLabel.text = weather.windSpeedString
            self.humidityLable.text = weather.humidityString
//            print(weather.cityPressure)
//            print(weather.pressureString)
//            print(weather.humidityString)
        }

    }
    
    func didFailWithEror(error: Error) {
        print(error)
        
    }

}

