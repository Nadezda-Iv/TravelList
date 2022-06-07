//
//  PlanningCollectionViewCellViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 06.06.2022.
//

import Foundation

class PlanningCollectionViewCellViewModel: CollectionViewCellViewModelType {
    
    private var planningRoute: PlaningRoute
    
    var imageName: String {
        return planningRoute.nameImageCell
    }
    
    var nameOfSection: String {
        return planningRoute.nameCell
    }
    
    init(route: PlaningRoute) {
        self.planningRoute = route
    }
    
}
