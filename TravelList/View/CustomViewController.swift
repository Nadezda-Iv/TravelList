//
//  CustomNavigationViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.05.2022.
//

import UIKit

class CustomViewController: UIViewController {
    
    var viewModel: TableViewViewModelType?
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        //tableView.dataSource = self()
        //tableView.delegate = self()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RouteTableViewCell")
        
        
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
       // self.view.addSubview(tableView)
        self.view.addSubview(newRouteButton)
        
        NSLayoutConstraint.activate([
      //      self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
        //    self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 30),
       //     self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -30),
       //     self.tableView.heightAnchor.constraint(equalToConstant: 400),
            
            self.newRouteButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.newRouteButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ].compactMap({ $0 }))
    }
    
   
    @objc func buttonAction(sender: UIButton!) {
       // let postViewController  = RoutePlanningCollectionViewController()
       // self.navigationController?.pushViewController(postViewController, animated: true)
       // self.navigationItem.backButtonTitle = "Back"
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
        
        /*let alert = UIAlertController(title: "Click on the button", message: "Click here.", preferredStyle: .alert)
        
        
        
        let buttonActionYes = UIAlertAction(title: "Save",
                                            style: .default,
                                            handler: {(action:UIAlertAction!) in
            print("you pressed the button")
        })
        
        let buttonActionNo = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("did you press the button after all")
        }
        
        alert.addAction(buttonActionYes)
        alert.addAction(buttonActionNo)
        
        self.present(alert, animated: true)
        */
    }

    
}

extension CustomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as? RouteTableViewCell else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        return cell
    }
    
    /*
     guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
     
     let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)

     tableViewCell.viewModel = cellViewModel

     return tableViewCell
     */
    
    
}
