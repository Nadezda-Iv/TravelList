//
//  WeatherTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 07.06.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    private var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .yellow
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 90, height: 80)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var temperatureLabel: UILabel = {
     let label = UILabel()
     label.textColor = .black
     //label.backgroundColor = .systemTeal
     label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.backgroundColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var feelsLikeTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.temperatureLabel)
        self.contentView.addSubview(self.feelsLikeTemperatureLabel)
        self.contentView.addSubview(self.weatherIconImageView)
        self.contentView.addSubview(self.dateLabel)
        
        NSLayoutConstraint.activate([
            self.temperatureLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.temperatureLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            self.temperatureLabel.widthAnchor.constraint(equalToConstant: 100),
            self.temperatureLabel.heightAnchor.constraint(equalToConstant: 55),
            
            self.weatherIconImageView.topAnchor.constraint(equalTo: self.temperatureLabel.topAnchor),
            self.weatherIconImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            self.weatherIconImageView.widthAnchor.constraint(equalToConstant: 100),
            self.weatherIconImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            self.feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: self.temperatureLabel.bottomAnchor, constant: 5),
            self.feelsLikeTemperatureLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 40),
            self.feelsLikeTemperatureLabel.heightAnchor.constraint(equalToConstant: 20),
            self.feelsLikeTemperatureLabel.widthAnchor.constraint(equalToConstant: 70),
            //self.dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.dateLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.dateLabel.heightAnchor.constraint(equalToConstant: 30),
            self.dateLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
            
            
            
            ].compactMap({ $0 }))
    }
    
}

