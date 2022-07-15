//
//  WeatherTableViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 24.06.2022.
//

import UIKit

class WeatherTableViewModel: WeatherTableViewModelType {
    
    private var forecastDataLoader: NetworkWeatherManager?
    private var imageF: UIImageView?

    let url2 = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=london&appid=742cd7ad0d004354528057f9c83e91be")
    private func config() {
        forecastDataLoader = NetworkWeatherManager()
        forecastDataLoader?.pullJsonData(url: url2, forecast: true){
        }
    }
    
    func numberOfRows() -> Int {
        return 5
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> WeatherTableViewCellViewModelType? {
       
        let icon = forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].weather[0].main
        switch icon ?? "Clear"{
        case "Clear": imageF?.image =  UIImage(systemName: "sun.max")
            case "Clouds": imageF?.image = UIImage(systemName: "cloud")
            default: imageF?.image = UIImage(systemName: "cloud.rain")
        }
        
        let temp = String(Int(forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].main.temp ?? 293)) + "°"
        
        let dtTxt = forecastDataLoader?.weatherData?.list?[indexPath.row * 8 + 5].dt_txt
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateValue = dtTxt ?? ""
        let date = dateFormatter.date(from: dateValue) ?? Date.now
        let dayOfWeek = Calendar.current.component(.weekday, from: date)
        
        let day = Calendar.current.weekdaySymbols[dayOfWeek - 1]
        
        let weather = WeatherModel(day: day, icon: imageF?.layer.name ?? "sun.max", temperature: temp)
        //print(icon)
        return WeatherTableViewCellViewModel(weatherModel: weather)
   
    }
    
        
    }
    
  
    
  
     
     
    
    /*
     
     let dtTxt = forecastDataLoader?.weatherData?.list?[indexPath.row * 8 + 5].dt_txt
     let dateFormatter = DateFormatter()
     dateFormatter.locale = Locale.current
     dateFormatter.timeZone = TimeZone.current
     dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
     let dateValue = dtTxt ?? ""
     let date = dateFormatter.date(from: dateValue) ?? Date.now
     let dayOfWeek = Calendar.current.component(.weekday, from: date)
     let day = Calendar.current.weekdaySymbols[dayOfWeek - 1]
     cell.day.text = day
     cell.temperature.text = String(Int(forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].main.temp ?? 293)) + "°"
     let image = forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].weather[0].main
     switch image ?? "Clear"{
         case "Clear": cell.weatherImage.image = UIImage(systemName: "sun.max")
         case "Clouds": cell.weatherImage.image = UIImage(systemName: "cloud")
         default: cell.weatherImage.image = UIImage(systemName: "cloud.rain")
     }
     
     switch currentDataLoader?.currentWeather?.main.main ?? "Clear" {
         case "Clear": cell.backgroundColor = UIColor(red: 71/225, green: 171/225, blue: 47/225, alpha: 1)
         case "Clouds": cell.backgroundColor = UIColor(red: 84/225, green: 113/225, blue: 124/225, alpha: 1)
         default: cell.backgroundColor = UIColor(red: 87/225, green: 87/225, blue: 93/225, alpha: 1)
     }
     return cell
 }
     */
    
    

    
    
//}
