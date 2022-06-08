//
//  PlanningCollectionViewCell.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.06.2022.
//

import UIKit


class PlanningCollectionViewCell: UICollectionViewCell {
    
    private var nameCell: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var imageCell: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 90, height: 80)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    
    
    weak var planningviewModel: CollectionViewCellViewModelType? {
        willSet(planningviewModel) {
            guard let viewModel = planningviewModel else { return }
            
            nameCell.text = viewModel.nameOfSection
            imageCell.image = UIImage(named: viewModel.imageName)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.cellStackView)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .systemTeal
        self.contentView.layer.cornerRadius = 15
        self.contentView.addSubview(self.cellStackView)
        self.cellStackView.addSubview(self.imageCell)
        self.cellStackView.addSubview(self.nameCell)
        
        self.contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            self.cellStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.cellStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.cellStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            self.cellStackView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            
            self.nameCell.topAnchor.constraint(equalTo: self.cellStackView.topAnchor, constant: 5),
            self.nameCell.leftAnchor.constraint(equalTo: self.cellStackView.leftAnchor, constant: 5),
            self.nameCell.heightAnchor.constraint(equalToConstant: 50),
            
            self.imageCell.topAnchor.constraint(equalTo: self.nameCell.bottomAnchor, constant: 45),
            self.imageCell.rightAnchor.constraint(equalTo: self.cellStackView.rightAnchor, constant: -5),
            self.imageCell.widthAnchor.constraint(equalToConstant: 100),
            self.imageCell.bottomAnchor.constraint(equalTo: self.cellStackView.bottomAnchor, constant: -15)
            
            ].compactMap({ $0 }))
    }
    
    
    
    
    
}
