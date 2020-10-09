//
//  TeamDetailsPresenter.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 08.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

protocol TeamDetailsPresentationLogic {
    func presentDetails(response: TeamDetails.ShowDetails.Response)
}

class TeamDetailsPresenter: TeamDetailsPresentationLogic {
    
    weak var viewController: TeamDetailsDisplayLogic?
    
    func presentDetails(response: TeamDetails.ShowDetails.Response) {
        
        let displaydDetails = TeamDetails.ShowDetails.ViewModel.DisplayedDetails(
            teamName: response.team.team?.name,
            city: response.team.team?.location,
            confirence: response.team.team?.conference,
            logoTeam: response.team.team?.image
        )
        
        let viewModel = TeamDetails.ShowDetails.ViewModel(displayedDetails: displaydDetails)
        viewController?.displayDetails(viewModel: viewModel)
    }
}
