//
//  TeamDetailsModels.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 08.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

enum TeamDetails {
    
    // MARK: Use cases
    enum ShowDetails {
        
        struct Request {
        }
        
        struct Response {
            let team: Team
        }
        
        struct ViewModel {
            
            struct DisplayedDetails {
                let teamName: String?
                let city: String?
                let confirence: String?
                let logoTeam: String?
            }
            
            let displayedDetails: DisplayedDetails
        }
    }
}
