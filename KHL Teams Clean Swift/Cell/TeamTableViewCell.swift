//
//  TeamTableViewCell.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogo: ImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var cityTeam: UILabel!
    @IBOutlet weak var divisionTeam: UILabel!
    
    func configureCell(with team: TeamList.fetchTeams.ViewModel.DisplayedTeams) {
        nameTeam.text = team.teamName
        cityTeam.text = team.city
        divisionTeam.text = team.division
        teamLogo.fetchImage(with: team.logoTeam)
    }
}
