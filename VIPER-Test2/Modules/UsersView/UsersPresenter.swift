//
//  UsersPresenter.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import Foundation

protocol UsersPresenterPr {
    // VIPER Components
    var view        : UsersViewPr? { get set}
    var router      : UsersRouter? {get set}
    var interactor  : UsersInteractorPr? {get set}
    // Properties
    var arrUsers: [Users]? {get set}
    
    //Methods
    
}

protocol UserInteractorOuput {
    // Properties
    
    
    // Methods
    func usersFetchedSuccessfully(with users: [Users])
    
    func usersFailedToFetch(with error: Error)
    
}

class UsersPresenter: UsersPresenterPr {

    
    
    //MARK:- Properties
    
    var view: UsersViewPr?
    
    var router: UsersRouter?
    
    var interactor: UsersInteractorPr?
    
    //MARK:- Methods

    var arrUsers: [Users]?
 

}

extension UsersPresenter: UserInteractorOuput {
    
    
    // Interactor Output
    
    func usersFetchedSuccessfully(with users: [Users]) {
        arrUsers = users
        let count = (users.count)
        view?.reloadTableView()
        print("UserFetched \(count) Users , \(arrUsers!.count).")
    }
    
    func usersFailedToFetch(with error: Error) {
        
        print("failed")
    }
    
    
}
