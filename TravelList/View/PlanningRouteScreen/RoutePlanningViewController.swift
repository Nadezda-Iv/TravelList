//
//  RoutePlanningCollectionViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 23.05.2022.
//

import UIKit

class RoutePlanningViewController: UIViewController {
    

    var model: CollectionViewModelType?
    var modelPlanningRoute: PlaningRoute?
    
    
    private lazy var nameRouteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = modelPlanningRoute?.cityName ?? "uio"
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 25
        return layout
    }()
    
    
    private lazy var planningCollectionView: UICollectionView = {
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        photoCollection.register(PlanningCollectionViewCell.self, forCellWithReuseIdentifier: "PlanningCollectionViewCell")
        photoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        return photoCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.model = CollectionViewModel()
        setupView()
    }
    
    
    func setupView() {
        
        self.view.addSubview(self.nameRouteLabel)
        self.view.addSubview(self.planningCollectionView)
        self.planningCollectionView.backgroundColor = .systemGray6
        NSLayoutConstraint.activate([
            self.nameRouteLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            self.nameRouteLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 35),
            self.nameRouteLabel.heightAnchor.constraint(equalToConstant: 55),
            
            
            self.planningCollectionView.topAnchor.constraint(equalTo: self.nameRouteLabel.bottomAnchor, constant: 25),
            self.planningCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.planningCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.planningCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ].compactMap({ $0 }))
        
    }
    
}


extension RoutePlanningViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.model?.numberOfItemInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanningCollectionViewCell", for: indexPath) as? PlanningCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let cellViewModel = model?.cellViewModel(cellForItemAt: indexPath)
        cell.planningviewModel = cellViewModel

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 170, height: 200)
       }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath)

        
        
       // let vc: UIViewController
        
        switch indexPath {
        case [0,0] : let vc = WeatherViewController();
            let viewText = PlaningRoute(cityName: modelPlanningRoute?.cityName ?? "4567890", nameCell: "", nameImageCell: "");
            vc.modelWeather = viewText; navigationController?.pushViewController(vc, animated: true); print(viewText.cityName)// white
        case [0,1] : let vc = CheckListViewController() // pink
        case [0,2] : let vc = ListOfPlacesViewController() // green
        case [0,3] : let vc = MapViewController() // yellow

        default:
           let vc = WeatherViewController()
        }
        //navigationController?.pushViewController(vc, animated: true)
    }
    
}
