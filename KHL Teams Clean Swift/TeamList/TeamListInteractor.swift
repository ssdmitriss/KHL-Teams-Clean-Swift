//
//  TeamListInteractor.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

protocol TeamListBusinessLogic {
    func fetchTeams(request: TeamList.fetchTeams.Request)
}

protocol TeamListDataStore {
    var teams: [Team] { get }
}

class TeamListInteractor: TeamListBusinessLogic, TeamListDataStore {
    
    var presenter: TeamListPresentationLogic?
    var teams: [Team] = []
    
    func fetchTeams(request: TeamList.fetchTeams.Request) {
        NetworkManager.shared.fetchData { teams in
            self.teams = teams
            
            let response = TeamList.fetchTeams.Response(teams: teams)
            self.presenter?.presentTeams(response: response)
        }
    }
}
