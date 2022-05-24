//
//  TableViewViewModelType.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 04.05.2022.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow() -> CollectionViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
