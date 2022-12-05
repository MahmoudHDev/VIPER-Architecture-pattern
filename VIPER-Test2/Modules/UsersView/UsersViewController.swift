//
//  ViewController.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import UIKit
import MBProgressHUD

protocol UsersViewPr: class {
    // Properties
    var presenter: UsersPresenterPr? {get set}
    // Methods
    func reloadTableView()
    
}
// Object

class UsersViewController: UIViewController, UsersViewPr{
    //MARK:- Properties
    weak var presenter: UsersPresenterPr?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UsersCellTableViewCell.myNib(), forCellReuseIdentifier: "cell")
        return table
    }()
    var hud: MBProgressHUD = MBProgressHUD()
    
    //MARK:- View Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = "Loading"
        self.setupCell()
        self.viewStyle()
        view.addSubview(tableView)
        view.addSubview(hud)
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
        let data = presenter?.arrUsers?[indexPath.row]
        
        cell.setupCell(title: data?.name ?? "No name", subTitle:data?.username ?? "No Username")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item has been selected")
        print(presenter!.arrUsers![indexPath.row].name!)
    }
    
    
    func reloadTableView() {
        
        DispatchQueue.main.async {
            self.hud.hide(animated: true)
            self.tableView.reloadData()

        }
    }
    
    
    
}
