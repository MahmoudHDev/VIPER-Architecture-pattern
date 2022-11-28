//
//  UsersRouter.swift
//  VIPER-Test2
//
//  Created by Mahmoud on 11/27/22.
//

import UIKit
typealias EntryPoint = UsersViewPr & UIViewController

protocol UsersRouterPr {
    
    var viewController: EntryPoint? {get}
    
    static func createModule() -> UsersRouterPr
}


class UsersRouter: UsersRouterPr {
    //MARK:- Properties
    var viewController: EntryPoint?

    
    //MARK:- Methods

    static func createModule() -> UsersRouterPr {
        let router = UsersRouter()
        
        var view: UsersViewPr   = UsersViewController()
        let interactor          = UsersInteractor()
        let presenter           = UsersPresenter()
        
        view.presenter          = presenter
        interactor.presenter    = presenter
        
        presenter.view          = view
        presenter.interactor    = interactor
        presenter.router        = router
        
        router.viewController = view as? EntryPoint
        // as? ==> Optional
        return router
    }
    
    
}
