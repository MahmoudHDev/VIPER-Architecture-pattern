//
//  ViewController.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import UIKit

protocol UsersViewPr {
    
    var presenter: UsersPresenterPr? {get set}
    
    
    func reloadTableView()
    
    
    
}


class UsersViewController: UIViewController, UsersViewPr{
    
    
    //MARK:- Properties
    var presenter: UsersPresenterPr?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UsersCellTableViewCell.myNib(), forCellReuseIdentifier: "cell")
        return table
    }()
    
    var numberOfRows: Int {
        return 0
    }
    
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
    
    //MARK:- Methods
    
    func setupCell() {
        self.tableView.dataSource   = self
        self.tableView.delegate     = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the count of the array from the presenter
        return presenter?.arrUsers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersCellTableViewCell
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }
    
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
//        print("from view\(presenter?.arrUsers?.count)")
    }
    
}
