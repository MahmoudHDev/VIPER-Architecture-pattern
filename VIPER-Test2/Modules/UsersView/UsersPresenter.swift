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

class UsersPresenter: UsersPresenterPr {
    //MARK:- Properties
    
    var view: UsersViewPr?
    
    var router: UsersRouter?
    
    var interactor: UsersInteractorPr?
    
    //MARK:- Methods

    
}
