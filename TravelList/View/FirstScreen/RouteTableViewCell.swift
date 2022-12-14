//
//  RouteTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.05.2022.
//

import UIKit

class RouteTableViewCell: UITableViewCell {
    
     var routeName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     var dates: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        self.contentView.backgroundColor = beige

        NSLayoutConstraint.activate([
            self.routeName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.routeName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            self.routeName.heightAnchor.constraint(equalToConstant: 50),
            self.routeName.widthAnchor.constraint(equalToConstant: 120),
            self.dates.topAnchor.constraint(equalTo: self.routeName.topAnchor),
            self.dates.leftAnchor.constraint(equalTo: self.routeName.rightAnchor, constant: 75),
            self.dates.heightAnchor.constraint(equalToConstant: 50)
            ].compactMap({ $0 }))
    }
    
}
