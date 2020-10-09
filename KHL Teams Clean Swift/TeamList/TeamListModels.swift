//
//  TeamListModels.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

enum TeamList {
    
    // MARK: Use cases
    enum fetchTeams {
        
        struct Request {
        }
        
        struct Response {
            var teams: [Team]
        }
        
        struct ViewModel {
            
            struct DisplayedTeams {
                var teamName: String?
                var city: String?
                var division: String?
                var logoTeam: String?
            }
            
            var displayedTeams: [DisplayedTeams]
        }
    }
}
