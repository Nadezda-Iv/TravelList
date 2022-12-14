//
//  TableViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import Foundation

class TableViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
 
    let empVM = CoreDataManagerViewModel()
    
    func numberOfRows() -> Int {
        return  empVM.empList.count 
    }
    
    
    func viewModelForSelectedRow() -> DetailRoutePlanningViewModelType? {
       guard let selectedIndexPath = selectedIndexPath else { return nil }
        let a = DetailRoutePlanningViewModelType(nameRoute: empVM.empList[selectedIndexPath.row])
        print(a)
        return DetailRoutePlanningViewModelType(nameRoute: empVM.empList[selectedIndexPath.row])
    }
    
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
