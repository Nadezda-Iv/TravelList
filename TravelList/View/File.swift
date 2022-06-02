//
//  File.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.06.2022.
//

import Foundation


/*
extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("890")
    
        print("\(String(describing: viewModel?.numberOfRows()))")
        return viewModel?.numberOfRows() ?? 0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("ayyyy56")
        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as? RouteTableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

        tableViewCell.viewModel = cellViewModel
        let a = tableViewCell.viewModel
        print(a?.routeName)
        return tableViewCell
       /* guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as? RouteTableViewCell else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            print("fyyyy")
            return cell
        }
        print("ayyy")
        return cell */
    }
    
    /*
     guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
     
     let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

     tableViewCell.viewModel = cellViewModel

     return tableViewCell
     */
    
    
}
*/
