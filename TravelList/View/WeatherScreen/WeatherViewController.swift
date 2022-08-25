//
//  WeatherViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 07.06.2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    var viewModelWeather: WeatherTableViewModelType?
    var modelWeather: PlaningRoute?
    
    private lazy var nameLabel: UILabel! = {
        let label = UILabel()
        label.text = "Погода в \(modelWeather!.cityName)"
        label.textColor = .black
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var tempMinLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .black
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .black
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempMaxLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .black
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    private var imageWeatherView: UIImageView! = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 90, height: 80)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
      var currentDataLoader: NetworkWeatherManager?
      var forecastDataLoader: NetworkWeatherManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.backgroundColor = beige
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fon-pogoda.png")!)
        
        config()
        viewModelWeather = WeatherTableViewModel()
        setupView()
        
        self.tableView.reloadData()
    }
    
    
    private func config() {

        currentDataLoader = NetworkWeatherManager()
        currentDataLoader?.fetchWeather(forRequestType: .currentWeather(city: "\(modelWeather!.cityName)")) {
            self.updateCurrentData()
        }
        
        forecastDataLoader = NetworkWeatherManager()
        forecastDataLoader?.fetchWeather(forRequestType: .forecastWeather(city: "\(modelWeather!.cityName)")){
            self.tableView.reloadData()
        }

    }
    
    func updateCurrentData() {

        self.tempLabel.text = "t = " +  String(Int((currentDataLoader?.currentWeather?.main.temp)!)) + "°"
        self.tempMaxLabel.text = "tMax = " +  String(Int((currentDataLoader?.currentWeather?.main.temp_max)!)) + "°"
        self.tempMinLabel.text = "tMin = " +  String(Int((currentDataLoader?.currentWeather?.main.temp_min)!)) + "°"
        
        
        switch currentDataLoader?.currentWeather?.main.main ?? "Clear" {
            case "Clear":
                self.imageWeatherView.image = UIImage(systemName: "sun.min.fill")
            print("sunny")
            case "Clouds":
                self.imageWeatherView.image = UIImage(systemName: "cloud.fill")
            print("cloud")
            case "Rainy":
                self.imageWeatherView.image = UIImage(systemName: "cloud.rain.fill")
            print("rain")
            default:
                self.imageWeatherView.image = UIImage(systemName: "sun.min.fill")
    
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
        
        let dtTxt = forecastDataLoader?.weatherData?.list?[indexPath.row * 8 + 5].dt_txt
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateValue = dtTxt ?? ""
        let date = dateFormatter.date(from: dateValue) ?? Date.now
        let dayOfWeek = Calendar.current.component(.weekday, from: date)
        let day = Calendar.current.weekdaySymbols[dayOfWeek - 1]
        cell?.dateLabel.text = day
        cell?.temperatureLabel.text = String(Int(forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].main.temp ?? 293)) + "°"
        let image = forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].weather[0].main
        switch image ?? "Clear"{
        case "Clear": cell?.weatherIconImageView.image = UIImage(systemName: "sun.max")
            case "Clouds": cell?.weatherIconImageView.image = UIImage(systemName: "cloud")
            default: cell?.weatherIconImageView.image = UIImage(systemName: "cloud.rain")
        }
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}

