//
//  CollectionViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 06.06.2022.
//

import Foundation

class CollectionViewModel: CollectionViewModelType {
    
    private var selectedIndexPath: IndexPath?
    

    private var iconCells: [PlaningRoute] = [
        PlaningRoute(cityName: "", nameCell: "Погода", nameImageCell: "weather"),
        PlaningRoute(cityName: "", nameCell: "Список вещей", nameImageCell: "luggage_bag"),
        PlaningRoute(cityName: "", nameCell: "Список мест", nameImageCell: "listRoute"),
        PlaningRoute(cityName: "", nameCell: "Карта маршрута", nameImageCell: "map")
        ]
    
    func numberOfItemInSection() -> Int {
        return iconCells.count
    }
    
    func cellViewModel(cellForItemAt indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        
        let profile = iconCells[indexPath.row]
        
        return PlanningCollectionViewCellViewModel(route: profile)
    }
    
    func viewModelForSelectedItem() -> Int? {
        return 4
    }
    
    
}
