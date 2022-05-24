//
//  TableViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import Foundation

class TableViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    var profiles = [
        Route(nameRoute: "TripOne", nameCity: ["Rostov", "Kazan"], travelDates: Date())
    ]
    
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(route: profile)
    }
    
    func viewModelForSelectedRow() -> CollectionViewModelType? {
       // guard let selectedIndexPath = selectedIndexPath else { return nil }
        //return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        
    }
    
    
}
