//
//  CollectionViewModelType.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 06.05.2022.
//

import Foundation


protocol CollectionViewModelType {
    func numberOfItemInSection() -> Int
    func cellViewModel(cellForItemAt indexPath: IndexPath) -> CollectionViewCellViewModelType?
    
    func viewModelForSelectedItem() -> Int? // переход на след вью (карта, погода, чеклист - зависит от номера ячейкки)
    func selectItem(atIndexPath indexPath: IndexPath) // нажатие на выбранную ячейку
}
