//
//  CustomNavigationViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.05.2022.
//

import UIKit
import CoreData

class CustomViewController: UIViewController {
    
    let empVM = CoreDataManagerViewModel()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои маршруты"
        label.textColor = .black
        label.backgroundColor = .systemFill
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RouteTableViewCell.self, forCellReuseIdentifier: "RouteTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private lazy var newRouteButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        empVM.getEmp()
        setupView()
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.view.addSubview(newRouteButton)
        self.view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            
            self.newRouteButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -55),
            self.newRouteButton.widthAnchor.constraint(equalToConstant: 55),
            self.newRouteButton.heightAnchor.constraint(equalToConstant: 55),
            self.newRouteButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -55),
            
            self.tableView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 35),
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.newRouteButton.topAnchor, constant: -25)
        ].compactMap({ $0 }))
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        let ac = UIAlertController(title: "Введите город и дату поездки", message: "", preferredStyle: .alert)
        
        ac.addTextField { action in }
        
    
         let buttonActionYes = UIAlertAction(title: "Сохранить", style: .default) { action in
         let tf = ac.textFields?.first?.text ?? ""
         self.empVM.addEmp(dates: Date.now, nameRoute: tf)
         self.tableView.reloadData()
     }
        let buttonActionNo = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("did you press the button after all")
        }
        ac.addAction(buttonActionYes)
        ac.addAction(buttonActionNo)
        
        self.present(ac, animated: true)
        self.tableView.reloadData()
    }
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empVM.empList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as! RouteTableViewCell
        let emp = empVM.empList[indexPath.row]
        cell.routeName.text = emp.nameRoute
        cell.dates.text = emp.dates?.description

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModelM = empVM.empList[indexPath.row] as? RouteEntity else { return }
        let vc = RoutePlanningViewController()
        let viewText = PlaningRoute(cityName: empVM.empList[indexPath.row].nameRoute ?? "city", nameCell: "", nameImageCell: "")
       
        vc.modelPlanningRoute = viewText
        navigationController?.pushViewController(vc, animated: true)
    
    tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        guard let route = empVM.empList[indexPath.row] as? RouteEntity, editingStyle == .delete else { return }
        empVM.deleteEmp(empToDelete: route)
        self.empVM.empList.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
 
    }
    
}

