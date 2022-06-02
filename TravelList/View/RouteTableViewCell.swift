//
//  RouteTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.05.2022.
//

import UIKit

class RouteTableViewCell: UITableViewCell {
    
    lazy var saveRoute = TableViewModel()
    lazy var array = CustomViewController()
    
    private var routeName: UILabel = {
        let label = UILabel()
        //label.text = "Joker"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var dates: UILabel = {
        let label = UILabel()
        //label.text = "Mr"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            print("lo")
           
            guard let viewModel = viewModel else { return }
            routeName.text = viewModel.routeName
            dates.text = viewModel.dates
            print("la")
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.routeName)
        self.contentView.addSubview(self.dates)
        
        NSLayoutConstraint.activate([
            self.routeName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.routeName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            self.routeName.heightAnchor.constraint(equalToConstant: 50),
            self.dates.topAnchor.constraint(equalTo: self.routeName.topAnchor),
            self.dates.leftAnchor.constraint(equalTo: self.routeName.rightAnchor, constant: 15),
            self.dates.heightAnchor.constraint(equalToConstant: 50)
            ].compactMap({ $0 }))
    }
    
}
