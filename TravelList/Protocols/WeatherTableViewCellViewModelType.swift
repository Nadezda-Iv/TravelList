//
//  ImageViewDetailType.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 06.05.2022.
//

import Foundation

protocol WeatherTableViewCellViewModelType: AnyObject {
    var dayWeek: String { get }
    var tempCurerentDay: String { get }
    var nameIconWeather: String {get}
  
}
