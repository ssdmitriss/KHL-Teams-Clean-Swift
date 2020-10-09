//
//  TeamListRouter.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//
import UIKit

@objc protocol TeamListRoutingLogic {
    func routeToTeamDetails(segue: UIStoryboardSegue?)
}

protocol TeamListDataPassing {
    var dataStore: TeamListDataStore? { get }
}

class TeamListRouter: NSObject, TeamListRoutingLogic, TeamListDataPassing {
    
    weak var viewController: TeamListViewController?
    var dataStore: TeamListDataStore?
    
    //     MARK: Routing
    func routeToTeamDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! TeamDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTeamDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTeamDetails(source: dataStore!, destination: &destinationDS)
            navigateToTeamDetails(source: viewController!, destination: destinationVC)
        }
    }
    
    //    MARK: Navigation
    func navigateToTeamDetails(source: TeamListViewController, destination: TeamDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
    //    MARK: Passing data
    func passDataToTeamDetails(source: TeamListDataStore, destination: inout TeamDetailsDataStore) {
        guard let indexPath = viewController?.tableView.indexPathForSelectedRow else { return }
        destination.team = source.teams[indexPath.row]
    }
}
