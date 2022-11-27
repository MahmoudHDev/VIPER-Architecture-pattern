//
//  UsersInteractor.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import Foundation

protocol UsersInteractorPr {
    
    var presenter: UsersPresenterPr? {get set}
    
    
}

class UsersInteractor: UsersInteractorPr {
    //MARK:- Properties

    var presenter: UsersPresenterPr?
    
    init() {
        print("Hi From interactor")
    }
    
    //MARK:- Mehtods
    
    
}
