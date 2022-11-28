//
//  UsersPresenter.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import Foundation

protocol UsersPresenterPr {
    var view        : UsersViewPr? { get set}
    var router      : UsersRouter? {get set}
    var interactor  : UsersInteractorPr? {get set}
    
}

protocol UserInteractorOuput {
    
    func usersFetchedSuccessfully(with users: [Users])
    
    func usersFailedToFetch(with error: Error)
}

class UsersPresenter: UsersPresenterPr {
    //MARK:- Properties
    
    var view: UsersViewPr?
    
    var router: UsersRouter?
    
    var interactor: UsersInteractorPr?
    
    //MARK:- Methods

    
}

extension UsersPresenter: UserInteractorOuput {
    
    // Interactor Output
    
    func usersFetchedSuccessfully(with users: [Users]) {
        print("users fetched")
    }
    
    func usersFailedToFetch(with error: Error) {
        print("failed")
    }
    
    
}
