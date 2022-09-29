//
//  CheckListTableViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 08.06.2022.
//

import Foundation
import UIKit


class CheckListTableViewCell: UITableViewCell {
    
    var task: UILabel = {
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
        self.contentView.addSubview(self.task)
        self.contentView.backgroundColor = beige

        NSLayoutConstraint.activate([
            self.task.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.task.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            self.task.heightAnchor.constraint(equalToConstant: 50),
            self.task.widthAnchor.constraint(equalToConstant: 120),

            ].compactMap({ $0 }))
    }
    
}
