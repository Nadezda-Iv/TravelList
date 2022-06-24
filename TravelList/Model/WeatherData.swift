//
//  CurrentWeatherData.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 21.06.2022.
//

import Foundation

struct CurrentWeatherNow: Codable {
    let name: String
    var main: String?
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
}

struct WeatherMain: Codable {
    let main: CurrentWeatherNow
}

struct WeatherData: Codable {
    let list : [List]?
}

struct Main: Codable {
    let temp : Float?
    let temp_max: Float?
    let temp_min: Float?
    let feels_like: Float?
    let humidity: Float?
}

struct ForecastWeather: Codable {
    let main: String?
    let description: String?
    let icon: String?
}

struct List: Codable {
    let main: Main
    let weather: [ForecastWeather]
    var dt_txt: String
}
