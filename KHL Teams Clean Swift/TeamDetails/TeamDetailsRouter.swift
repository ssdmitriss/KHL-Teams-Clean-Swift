//
//  TeamDetailsRouter.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 08.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

@objc protocol TeamDetailsRoutingLogic {
    
}

protocol TeamDetailsDataPassing {
    var dataStore: TeamDetailsDataStore? { get }
}

class TeamDetailsRouter: NSObject, TeamDetailsRoutingLogic, TeamDetailsDataPassing {
    
    weak var viewController: TeamDetailsViewController?
    var dataStore: TeamDetailsDataStore?
    
}

