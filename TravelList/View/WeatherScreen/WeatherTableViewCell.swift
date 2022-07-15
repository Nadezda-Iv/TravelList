//
//  WeatherTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 07.06.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var networkWeatherManager = NetworkWeatherManager()
    var nameCityForWeather: String?
    
     var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 80, height: 80)
        //imageView.clipsToBounds = true
        //imageView.contentMode = .scaleToFill
        //imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

     var temperatureLabel: UILabel = {
     let label = UILabel()
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
    
     var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    weak var viewModel: WeatherTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            temperatureLabel.text = viewModel.tempCurerentDay
            dateLabel.text = viewModel.dayWeek
            weatherIconImageView.image = UIImage(named: viewModel.nameIconWeather )
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
       required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let sunnyColor = UIColor(red: 136/225, green: 217/225, blue: 235/225, alpha: 1)
        self.contentView.backgroundColor = sunnyColor
        self.contentView.addSubview(self.temperatureLabel)
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
            
        
            self.dateLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.dateLabel.heightAnchor.constraint(equalToConstant: 30),
            self.dateLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
            ].compactMap({ $0 }))
    }
    
}


