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

    
    func numberOfRows() -> Int {
        return 5
    }
}
    

