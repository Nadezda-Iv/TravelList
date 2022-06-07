//
//  RoutePlanningCollectionViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import UIKit

class RoutePlanningViewController: UIViewController {
    
    private var planningViewModel: DetailRoutePlanningViewModelType?
    
    private lazy var nameRouteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = planningViewModel?.namePage.nameRoute
        //label.text = "Fttttt"
        label.backgroundColor = .systemFill
        label.layer.masksToBounds = true
        //label.layer.cornerRadius = 25
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 25
        return layout
    }()
    
    
    private lazy var planningCollectionView: UICollectionView = {
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        photoCollection.backgroundColor = .systemBrown
        photoCollection.register(PlanningCollectionViewCell.self, forCellWithReuseIdentifier: "PlanningCollectionViewCell")
        photoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        return photoCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupView()
    }
    
    
    func setupView() {
        
        self.view.addSubview(self.nameRouteLabel)
        self.view.addSubview(self.planningCollectionView)
        
        NSLayoutConstraint.activate([
            self.nameRouteLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            self.nameRouteLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 35),
            self.nameRouteLabel.heightAnchor.constraint(equalToConstant: 55),
            
            
            self.planningCollectionView.topAnchor.constraint(equalTo: self.nameRouteLabel.bottomAnchor, constant: 25),
            self.planningCollectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.planningCollectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.planningCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ].compactMap({ $0 }))
        
    }
    
}


extension RoutePlanningCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(iconsCell.count)
        return iconsCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanningCollectionViewCell", for: indexPath) as? PlanningCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            
            print("fghhjuyt")
            return cell
        }
        //let photo = self.dataSource[indexPath.row]
        //cell.setup(photo: photo!)
        return cell
    }
    
    
}
