//
//  CheckListViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 08.06.2022.
//

import Foundation
import UIKit

class CheckListViewController: UIViewController {
    
    var modelChecklist: PlaningRoute?
    
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
    
    
    private lazy var newTaskButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = beige
        button.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        let customButtonTitle = NSMutableAttributedString(string: "+", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 50),
            NSAttributedString.Key.backgroundColor: UIColor.clear,
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue
        ])
        button.setAttributedTitle(customButtonTitle, for: .normal)
        return button
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
            self.nameLabel.heightAnchor.constraint(equalToConstant: 60),
            self.newTaskButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -55),
            self.newTaskButton.widthAnchor.constraint(equalToConstant: 75),
            self.newTaskButton.heightAnchor.constraint(equalToConstant: 75),
            self.newTaskButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -55)
        ].compactMap({ $0 }))
    }
    
}
