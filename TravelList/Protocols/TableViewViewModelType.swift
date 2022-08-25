//
//  TableViewViewModelType.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 04.05.2022.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func viewModelForSelectedRow() -> DetailRoutePlanningViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
