//
//  TableViewCellViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 24.05.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var modelRoute: RouteEntity
    
    
    
    var routeName: String {
        return modelRoute.nameRoute ?? "1"
    }
    
    var dates: String {
        let dateLabel = modelRoute.dates?.formatted()
        // modelRoute.dates?.description
        return  dateLabel  ?? "05"
       // return String(describing: modelRoute.travelDates)
    }
    
    init(route: RouteEntity) {
        self.modelRoute = route
    }
    

    
}
