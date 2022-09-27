//
//  CheckListViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 08.06.2022.
//

import Foundation
import UIKit

class CheckListViewController: UIViewController {
    
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Список вещей с собой"
        label.textColor = .black
        label.backgroundColor = beige
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .systemPink
        self.view.addSubview(nameLabel)
        
        
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ].compactMap({ $0 }))
    }
    
}
