//
//  NetworkManager.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 08.06.2022.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
    //let apiKey = "0db510d5ae931965598605249e904349"
    
    var weatherData: WeatherData?
    var currentWeather: WeatherMain?

    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Sochi&appid=0db510d5ae931965598605249e904349")
    let url2 = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Sochi&appid=0db510d5ae931965598605249e904349")

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
