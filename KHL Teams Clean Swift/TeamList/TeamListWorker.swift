//
//  TeamListWorker.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

class TeamListWorker {
    func getDisplayedTeams(with teams: [Team]) -> [TeamList.fetchTeams.ViewModel.DisplayedTeams] {
        
        var displayedTeams: [TeamList.fetchTeams.ViewModel.DisplayedTeams] = []
        
        teams.forEach { teams in
            let teamName = teams.team?.name
            let city = teams.team?.location
            let division = teams.team?.division
            let logoTeam = teams.team?.image
            
            let displayedTeam = TeamList.fetchTeams.ViewModel.DisplayedTeams(
                teamName: teamName,
                city: city,
                division: division,
                logoTeam: logoTeam
            )
            displayedTeams.append(displayedTeam)
        }
        return displayedTeams
    }
}
