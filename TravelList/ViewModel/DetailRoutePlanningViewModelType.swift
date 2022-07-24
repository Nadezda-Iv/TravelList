//
//  DetailRoutePlanningViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 24.05.2022.
//

import UIKit

class DetailRoutePlanningViewModelType: ViewDetailType {
    
    internal var namePage: RouteEntity //  изменить
    
    var description: String {
        return String(describing: "\(String(describing: namePage.nameRoute))  c \(String(namePage.dates!.description))")
    }
    
    var age: Box<String?> = Box(nil)
    
    init(nameRoute: RouteEntity) {
        self.namePage = nameRoute
    }

}
