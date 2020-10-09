//
//  TeamListPresenter.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

protocol TeamListPresentationLogic {
    func presentTeams(response: TeamList.fetchTeams.Response)
}

class TeamListPresenter: TeamListPresentationLogic {
    
    weak var viewController: TeamListDisplayLogic?
    var worker: TeamListWorker?
    
    func presentTeams(response: TeamList.fetchTeams.Response) {
        worker = TeamListWorker()
        guard let displayedTeams = worker?.getDisplayedTeams(with: response.teams) else { return }
        let viewModel = TeamList.fetchTeams.ViewModel(displayedTeams: displayedTeams)
        viewController?.displayTeams(viewModel: viewModel)
    }
}
