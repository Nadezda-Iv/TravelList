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
   // func selectItem(atIndexPath indexPath: IndexPath) // нажатие на выбранную ячейку
}


/*
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell
     print(indexPath)
     cell?.updateText("BBB")
 }
 */
