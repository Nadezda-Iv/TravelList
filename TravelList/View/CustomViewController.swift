//
//  CustomNavigationViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.05.2022.
//

import UIKit

class CustomViewController: UIViewController {
    
    var viewModel: TableViewViewModelType?
    //var routeName: [RouteEntity] = []
    
    var userRoute: [Route] = [
        Route(nameRoute: "London", nameCity: ["1", "2"], travelDates: Date()),
        Route(nameRoute: "Moskoy", nameCity: ["3", "4"], travelDates: Date())]
    
    
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
    
    /*private lazy var alphaForTableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        //view.alpha = 1
        
        return view
    }() */
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .red
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
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableViewModel()
        setupView()
        self.tableView.reloadData()
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
            
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 115),
            self.tableView.leftAnchor.constraint(equalTo: self.nameLabel.leftAnchor,constant: 15),
            self.tableView.rightAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: -15),
            self.tableView.heightAnchor.constraint(equalToConstant: 350)
        ].compactMap({ $0 }))
    }
    
   
    @objc func buttonAction(sender: UIButton!) {
        let ac = UIAlertController(title: "Click on the button", message: "Click here.", preferredStyle: .alert)
        ac.addTextField { action in }
        ac.addTextField { action in }
        
        let buttonActionYes = UIAlertAction(title: "Save",
                                            style: .default,
                                            handler: {(action:UIAlertAction!) in
            print("you pressed the button")
        })
        
        let buttonActionNo = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("did you press the button after all")
        }
        
        ac.addAction(buttonActionYes)
        ac.addAction(buttonActionNo)
        
        self.present(ac, animated: true)
     
    }

    
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as? RouteTableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

        tableViewCell.viewModel = cellViewModel
        let a = tableViewCell.viewModel
        return tableViewCell
    }
    
    
    
}
