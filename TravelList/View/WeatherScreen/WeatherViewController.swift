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
 
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        //networkWeatherManager.fetchCurrentWeather(forCity: "London")
        setupView()
        self.tableView.reloadData()
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            
            
            self.tableView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 35),
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}

