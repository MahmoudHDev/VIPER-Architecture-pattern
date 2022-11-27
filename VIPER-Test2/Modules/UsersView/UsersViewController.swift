//
//  ViewController.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import UIKit

protocol UsersViewPr {
    
    var presenter: UsersPresenterPr? {get set}
    
}


class UsersViewController: UIViewController, UsersViewPr{
    
    //MARK:- Properties
    var presenter: UsersPresenterPr?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //MARK:- View Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
        self.viewStyle()
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK:- functions
    func viewStyle() {
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

//MARK:- Extension TableViewDataSource & TableViewDelegate
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupCell() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }
    
    
}
