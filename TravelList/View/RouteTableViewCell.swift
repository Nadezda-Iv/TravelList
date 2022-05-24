//
//  RouteTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.05.2022.
//

import UIKit

class RouteTableViewCell: UITableViewCell {
    private var routeName: UILabel = {
        let label = UILabel()
        label.text = "Joker"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var dates: UILabel = {
        let label = UILabel()
        label.text = "Mr"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            routeName.text = viewModel.routeName
            dates.text = viewModel.dates
        }
    }
}
