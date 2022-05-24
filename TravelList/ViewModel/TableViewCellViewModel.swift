//
//  TableViewCellViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 24.05.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var modelRoute: Route
    
    var routeName: String {
        return modelRoute.nameRoute
    }
    
    var dates: String {
        return String(describing: modelRoute.travelDates)
    }
    
    init(route: Route) {
        self.modelRoute = route
    }
    
}
