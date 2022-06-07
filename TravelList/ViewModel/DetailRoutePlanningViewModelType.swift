//
//  DetailRoutePlanningViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 24.05.2022.
//

import UIKit

class DetailRoutePlanningViewModelType: ViewDetailType {
    
    internal var namePage: Route //  изменить
    
    var description: String {
        return String(describing: "\(namePage.nameRoute)  c \(String(namePage.travelDates.description))")
    }
    
    var age: Box<String?> = Box(nil)
    
    init(nameRoute: Route) {
        self.namePage = nameRoute
    }

}
