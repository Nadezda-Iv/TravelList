//
//  WeatherViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 07.06.2022.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    //var networkWeatherManager = NetworkWeatherManager()
    var viewModelWeather: WeatherTableViewModelType?
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Погода в "
        label.textColor = .black
        label.backgroundColor = .systemFill
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
        label.backgroundColor = .systemFill
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .systemFill
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempMaxLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .systemFill
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
 
    private var imageWeatherView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        //imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 90, height: 80)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.white.cgColor
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
        view.backgroundColor = .systemGray6
        
        viewModelWeather = WeatherTableViewModel()
        setupView()
        self.tableView.reloadData()
    }
    private func config() {
        
        currentDataLoader = NetworkWeatherManager()
        currentDataLoader?.pullJsonData(url: currentDataLoader?.url, forecast: false) {
            self.updateCurrentData()
        }
        
        forecastDataLoader = NetworkWeatherManager()
        forecastDataLoader?.pullJsonData(url: forecastDataLoader?.url2, forecast: true){
            self.tableView.reloadData()
        }
    }
    
    func updateCurrentData() {
        self.tempMaxLabel.text = String(Int((currentDataLoader?.currentWeather?.main.temp_max)!)) + "°"
        self.tempMinLabel.text = String(Int((currentDataLoader?.currentWeather?.main.temp_min)!)) + "°"
        self.tempLabel.text = String(Int((currentDataLoader?.currentWeather?.main.temp)!)) + "°"
        
        tableView.reloadData()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(imageWeatherView)
        self.view.addSubview(tempStackView)
        self.tempStackView.addSubview(tempMinLabel)
        self.tempStackView.addSubview(tempLabel)
        self.tempStackView.addSubview(tempMaxLabel)
        
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            self.imageWeatherView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            self.imageWeatherView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            self.tempStackView.topAnchor.constraint(equalTo: self.imageWeatherView.bottomAnchor, constant: 5),
            self.tempStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            self.tempStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.tempStackView.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.tableView.topAnchor.constraint(equalTo: self.tempStackView.bottomAnchor, constant: 15),
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
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
        cell.dateLabel?.text = day
        cell.temperatureLabel?.text = String(Int(forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].main.temp ?? 293)) + "°"
        let image = forecastDataLoader?.weatherData?.list![indexPath.row * 8 + 5].weather[0].main
        switch image ?? "Clear"{
        case "Clear": cell.weatherIconImageView?.image = UIImage(systemName: "sun.max")
        case "Clouds": cell.weatherIconImageView?.image = UIImage(systemName: "cloud")
        default: cell.weatherIconImageView?.image = UIImage(systemName: "cloud.rain")
        }
        */
        
        //return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}

