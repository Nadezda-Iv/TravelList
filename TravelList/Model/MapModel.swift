//
//  MapModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 07.06.2022.
//

import Foundation

struct MapModel {
    let nameCity: String
}


/*
 
 import Foundation
 import UIKit

 class WeatherViewController: UIViewController {
     
     var networkWeatherManager = NetworkWeatherManager()
     var viewModelWeather: WeatherTableViewModelType?
     var modelWeather: PlaningRoute?
     
     private lazy var nameLabel: UILabel = {
         let label = UILabel()
         label.text = "Погода в \(modelWeather!.cityName)"
         label.textColor = .black
         label.backgroundColor = .white
         label.layer.masksToBounds = true
         label.layer.cornerRadius = 25
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     private lazy var tempMinLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.backgroundColor = .white
         label.layer.masksToBounds = true
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private lazy var tempLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.backgroundColor = .white
         label.layer.masksToBounds = true
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private lazy var tempMaxLabel: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.backgroundColor = .white
         label.layer.masksToBounds = true
         label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
  
     private var imageWeatherView: UIImageView = {
         let imageView = UIImageView()
         imageView.backgroundColor = .red
         imageView.frame.size = CGSize(width: 90, height: 80)
         imageView.clipsToBounds = true
         imageView.contentMode = .scaleToFill
         imageView.layer.borderColor = UIColor.white.cgColor
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
     
     private lazy var tableView: UITableView = {
         let tableView = UITableView()
         //let sunnyColor = UIColor(red: 0/225, green: 182/225, blue: 255/225, alpha: 1)
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
         tableView.dataSource = self
         tableView.delegate = self
         //tableView.backgroundColor = sunnyColor
         tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
         tableView.translatesAutoresizingMaskIntoConstraints = false
         return tableView
     }()
     
       var currentDataLoader: NetworkWeatherManager?
     //var forecastDataLoader: NetworkWeatherManager?
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.contentMode = UIView.ContentMode.scaleAspectFill
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fon-pogoda.png")!)
         
         
         viewModelWeather = WeatherTableViewModel()
         setupView()
         config()
         self.tableView.reloadData()
     }
     
      private func config() {
         
         currentDataLoader = NetworkWeatherManager()
         currentDataLoader?.pullJsonData(url: currentDataLoader?.url, forecast: false) {
             
             self.updateCurrentData()
         }
         
     }
     
     func updateCurrentData() {
      
         self.tempMaxLabel.text = "t Max " + String(Int((currentDataLoader?.currentWeather?.main.temp_max) ?? 900)) + "°"
         self.tempMinLabel.text = "t Min " + String(Int((currentDataLoader?.currentWeather?.main.temp_min) ?? 800)) + "°"
         self.tempLabel.text = "t " + String(Int((currentDataLoader?.currentWeather?.main.temp) ?? 700)) + "°"
         
         switch currentDataLoader?.currentWeather?.main.main ?? "Clear" {
             case "Clear":
                 self.imageWeatherView.image = UIImage(named: "sun.min.fill")
             case "Clouds":
                 self.imageWeatherView.image = UIImage(named: "cloud.fill")
              
             case "Rainy":
                 self.imageWeatherView.image = UIImage(named: "cloud.rain.fill")

             default:
                 self.imageWeatherView.image = UIImage(named: "sun.min.fill")
         }
         
     }
     
     private func setupView() {
         self.view.addSubview(tableView)
         self.view.addSubview(nameLabel)
         self.view.addSubview(imageWeatherView)
     
         self.view.addSubview(tempMinLabel)
         self.view.addSubview(tempLabel)
         self.view.addSubview(tempMaxLabel)
         
         
         NSLayoutConstraint.activate([
             
             
             self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
             self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
             self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
             
             self.imageWeatherView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
             self.imageWeatherView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
             self.imageWeatherView.widthAnchor.constraint(equalToConstant: 80),
             self.imageWeatherView.heightAnchor.constraint(equalToConstant: 80),
             
             self.tempMinLabel.topAnchor.constraint(equalTo: self.imageWeatherView.bottomAnchor, constant: 20),
             self.tempMinLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10),
             self.tempMinLabel.heightAnchor.constraint(equalToConstant: 30),
             self.tempMinLabel.widthAnchor.constraint(equalToConstant: 100),
             
             self.tempLabel.topAnchor.constraint(equalTo: self.tempMinLabel.topAnchor),
             self.tempLabel.leftAnchor.constraint(equalTo: self.tempMinLabel.rightAnchor, constant: 20),
             self.tempLabel.widthAnchor.constraint(equalToConstant: 100),
             self.tempLabel.heightAnchor.constraint(equalToConstant: 30),
             
             self.tempMaxLabel.topAnchor.constraint(equalTo: self.tempMinLabel.topAnchor),
             self.tempMaxLabel.leftAnchor.constraint(equalTo: self.tempLabel.rightAnchor, constant: 20),
             self.tempMaxLabel.widthAnchor.constraint(equalToConstant: 100),
             self.tempMaxLabel.heightAnchor.constraint(equalToConstant: 30),
             
             self.tableView.topAnchor.constraint(equalTo: self.tempMinLabel.bottomAnchor, constant: 15),
             self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
             self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
             //self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
             //self.tableView.heightAnchor.constraint(equalToConstant: self.tableView.contentSize.height)
             self.tableView.heightAnchor.constraint(equalToConstant: 400)
         ].compactMap({ $0 }))
     }
        
     }
     



 extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell
         
          guard let tableViewCell = cell, let viewModel = viewModelWeather else { return UITableViewCell() }
          
          let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

          tableViewCell.viewModel = cellViewModel
          return tableViewCell
         
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return CGFloat(80)
     }
 }


 */


/*
 
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

 */
