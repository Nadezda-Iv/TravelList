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
    
    //let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=london&appid=742cd7ad0d004354528057f9c83e91be")
    //let url2 = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=london&appid=742cd7ad0d004354528057f9c83e91be")

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


/*
 
 var onCompletion: ((CurrentWeather) -> Void)?
 
 func fetchCurrentWeather(forCity city: String) {
     let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
     guard let url = URL(string: urlString) else { return }
     let session = URLSession(configuration: .default)
     let task = session.dataTask(with: url) { data, response, error in
         if let data = data {
             if let currentWeather = self.parseJSON(withData: data) {
                 self.onCompletion?(currentWeather)
             }
         }
     }
     task.resume()
 }
 
 func parseJSON(withData data: Data) -> CurrentWeather? {
     let decoder = JSONDecoder()
     do {
         let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
         guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
             return nil
         }
         return currentWeather
     } catch let error as NSError {
         print(error.localizedDescription)
     }
     return nil
 }
}

 */
