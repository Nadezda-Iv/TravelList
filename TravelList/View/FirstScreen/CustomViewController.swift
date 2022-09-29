//
//  CustomNavigationViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.05.2022.
//

import UIKit
import CoreData

class CustomViewController: UIViewController {
    
    let routeVM = CoreDataManagerViewModel()
    
    weak var textField_Date: UITextField! = {
        let textField = UITextField()
        textField.placeholder = "Date"
        
        return textField
    }()
    
    var myDatePicker: UIDatePicker? = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        return datePicker
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои маршруты"
        label.textColor = .black
        label.backgroundColor = beige
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
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.layer.cornerRadius = 35
        tableView.layer.masksToBounds = true
        tableView.register(RouteTableViewCell.self, forCellReuseIdentifier: "RouteTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    private lazy var newRouteButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = beige
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
        routeVM.getRoute()
        setupView()
    }
    
    
    private func setupView() {
        self.view.backgroundColor = beige
        self.view.addSubview(tableView)
        self.view.addSubview(newRouteButton)
        self.view.addSubview(nameLabel)
        
        
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            
            self.newRouteButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -55),
            self.newRouteButton.widthAnchor.constraint(equalToConstant: 75),
            self.newRouteButton.heightAnchor.constraint(equalToConstant: 75),
            self.newRouteButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -55),
            
            self.tableView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 35),
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.newRouteButton.topAnchor, constant: -25)
        ].compactMap({ $0 }))
    }
    
    // MARK:- Add new rout button
    
    @objc func buttonAction(sender: UIButton!) {
        let ac = UIAlertController(title: "Введите город и дату поездки на латиннице", message: "", preferredStyle: .alert)
        
        ac.addTextField { action in }
        ac.addTextField { (textField) in
            
            let tollbar = UIToolbar()
            tollbar.frame = CGRect(x: 0, y: -30, width: 300, height: 350)
            tollbar.sizeToFit()
            self.myDatePicker?.datePickerMode = UIDatePicker.Mode.date
            self.myDatePicker?.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
            let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneac))
            tollbar.setItems([donebutton], animated: true)
           
            
            textField.inputView = self.myDatePicker
            textField.inputAccessoryView = tollbar
            self.textField_Date = textField
        }
        
        
        
        let buttonActionYes = UIAlertAction(title: "Сохранить", style: .default) { action in
            let tf = ac.textFields?.first?.text ?? ""

            let dateQ = self.myDatePicker!.date
  
            
            self.routeVM.addRoute(dates: dateQ, nameRoute: tf)
            self.routeVM.getRoute()
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
     
     // MARK:- Button Done and Cancel

    @objc func doneac() {
        self.myDatePicker?.datePickerMode = .dateAndTime
        let dateForm = self.myDatePicker!.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        textField_Date.text = dateFormatter.string(from: dateForm)
        self.view.endEditing(true)
    }
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Город и дата поездки"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeVM.routeList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as! RouteTableViewCell
        let route = routeVM.routeList[indexPath.row]
        cell.routeName.text = route.nameRoute
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " dd. MM. yyyy "
        let dateLabel = dateFormatter.string(from: route.dates!)
        cell.dates.text = dateLabel


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard routeVM.routeList[indexPath.row] is RouteEntity else { return }
        let vc = RoutePlanningViewController()
        let viewText = PlaningRoute(cityName: routeVM.routeList[indexPath.row].nameRoute ?? "city", nameCell: "", nameImageCell: "")
       
        vc.modelPlanningRoute = viewText
        navigationController?.pushViewController(vc, animated: true)
    
    tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        guard let route = routeVM.routeList[indexPath.row] as? RouteEntity, editingStyle == .delete else { return }
        routeVM.deleteRoute(routeToDelete: route)
        self.routeVM.routeList.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
 
    }
    
}

