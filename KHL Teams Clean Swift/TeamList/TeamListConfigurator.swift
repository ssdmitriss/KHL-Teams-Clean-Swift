//
//  TeamListConfigurator.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

class TeamListConfigurator {
    
    static let shared = TeamListConfigurator()
    
    func configure(with view: TeamListViewController) {
        let viewController = view
        let interactor = TeamListInteractor()
        let presenter = TeamListPresenter()
        let router = TeamListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
