//
//  TableViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import Foundation

class TableViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
 
    let routeVM = CoreDataManagerViewModel()
    
    func numberOfRows() -> Int {
        return  routeVM.routeList.count
    }
    
    
    func viewModelForSelectedRow() -> DetailRoutePlanningViewModelType? {
       guard let selectedIndexPath = selectedIndexPath else { return nil }
        let a = DetailRoutePlanningViewModelType(nameRoute: routeVM.routeList[selectedIndexPath.row])
        return DetailRoutePlanningViewModelType(nameRoute: routeVM.routeList[selectedIndexPath.row])
    }
    
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
