//
//  CustomNavigationViewController.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 02.05.2022.
//

import UIKit

class CustomViewController: UIViewController {
    
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        //tableView.dataSource = self
        //tableView.delegate = self
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
        return button
    }()

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        newRouteButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .clear
        self.view.addSubview(tableView)
        self.view.addSubview(newRouteButton)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: 400),
            
            self.newRouteButton.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 100),
            self.newRouteButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -50),
            self.newRouteButton.heightAnchor.constraint(equalToConstant: 80),
            self.newRouteButton.widthAnchor.constraint(equalToConstant: 80)
        ].compactMap({ $0 }))
    }
    
   
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = RoutePlanningCollectionViewController()
        //postViewController.textTitle.title = post.title
        self.navigationController?.pushViewController(postViewController, animated: false)
        self.navigationItem.backButtonTitle = "Back"
        print("fgfhgfjg")
    }
    
}
