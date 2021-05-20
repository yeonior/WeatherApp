//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by ruslan on 16.05.2021.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(String(format: "%.1f", temperature)) ºC"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "Feels like \(String(format: "%.1f", feelsLikeTemperature)) ºC"
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        
        switch conditionCode {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.heavyrain.fill"
        case 600...632:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.min.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
