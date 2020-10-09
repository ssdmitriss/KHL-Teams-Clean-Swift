//
//  TeamDetailsInteractor.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 08.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

protocol TeamDetailsBusinessLogic {
    func showDetails(request: TeamDetails.ShowDetails.Request)
}

protocol TeamDetailsDataStore {
    var team: Team! { get set }
}

class TeamDetailsInteractor: TeamDetailsBusinessLogic, TeamDetailsDataStore {
    
    var presenter: TeamDetailsPresentationLogic?
    var worker: TeamDetailsWorker?
    var team: Team!
    
    
    func showDetails(request: TeamDetails.ShowDetails.Request) {
        worker = TeamDetailsWorker()
        worker?.doSomeWork()
        
        let response = TeamDetails.ShowDetails.Response(team: team)
        presenter?.presentDetails(response: response)
    }
}
