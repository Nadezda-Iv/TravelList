//
//  TableViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import Foundation

class TableViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    var userRoute: [Route] = [
        Route(nameRoute: "London", nameCity: ["1", "2"], travelDates: Date()),
        Route(nameRoute: "Moscow", nameCity: ["3", "4"], travelDates: Date()),
        Route(nameRoute: "Sochi", nameCity: ["2", "56"], travelDates: Date())]
    //var routeSave: [RouteEntity] = []

    
    func numberOfRows() -> Int {
        return userRoute.count
        
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = userRoute[indexPath.row]
        return TableViewCellViewModel(route: profile)
    }
    
    
    func viewModelForSelectedRow() -> DetailRoutePlanningViewModelType? {
       guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailRoutePlanningViewModelType(nameRoute: userRoute[selectedIndexPath.row])
    }
    
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
