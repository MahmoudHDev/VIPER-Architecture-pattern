//
//  UsersInteractor.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import Foundation

protocol UsersInteractorPr {
    // Properties
    var presenter: UserInteractorOuput? {get set}
    
    // Methods
    func getUsers()
}

class UsersInteractor: UsersInteractorPr {
    
    //MARK:- Properties
    var presenter   : UserInteractorOuput?
    var userWorker  : UsersWorker = UsersWorker()
    
    //MARK:- Init
    init() {
        getUsers()
    }
    
    //MARK:- Mehtods
    func getUsers() {
        print("Getting users")
        self.userWorker.getData { (result) in
            switch result {
            case .success(let arrUsers):
                print("count of users \(arrUsers.count)")
                // Send the users to the view
                self.presenter?.usersFetchedSuccessfully(with: arrUsers)
            case .failure(let err):
                self.presenter?.usersFailedToFetch(with: err)
                print("error \(err.localizedDescription)")
            }
        }
    }
}
