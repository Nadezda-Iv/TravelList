//
//  NetworkManager.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 08.06.2022.
//
import Foundation

public class NetworkWeatherManager {
    
    var weatherData: WeatherData?
    var currentWeather: WeatherMain?

    enum RequestType {
        case currentWeather(city: String)
        case forecastWeather(city: String)
    }
    
    func fetchWeather(forRequestType requestType: RequestType, completionHandler: @escaping () -> Void) {
        var urlString = ""
        switch requestType {
        case .currentWeather(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=742cd7ad0d004354528057f9c83e91be&units=metric"
            pullJsonData(url: URL(string: urlString), forecast: false, completionHandler: completionHandler)
            
        case .forecastWeather(let city):
            urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=742cd7ad0d004354528057f9c83e91be&units=metric"
            pullJsonData(url: URL(string: urlString), forecast: true, completionHandler: completionHandler)
        }
        
    }

    func decodeJSONForecast(JSONData: Data, completionHandler: () -> Void) {
        let response = try! JSONDecoder().decode(WeatherData.self, from: JSONData)
        weatherData = response
        completionHandler()
    }


    func decodeJSONData(JSONData: Data, completionHandler: () -> Void) {
        do{
            let response = try? JSONDecoder().decode(WeatherMain.self, from: JSONData)
            currentWeather = response
            completionHandler()
        }
    }

    func pullJsonData(url: URL?, forecast: Bool, completionHandler: @escaping () -> Void) {
        let task = URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error : \(error.localizedDescription)")
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Error : HTTP Response Code Error")
                    return
                }
                guard let data = data else {
                    print("Error : No Response")
                    return
                }
                if (!forecast) {
                    self.decodeJSONData(JSONData: data, completionHandler: completionHandler)
                } else {
                    self.decodeJSONForecast(JSONData: data, completionHandler: completionHandler)
                }
            }
        }
        task.resume()
    }
    
}
