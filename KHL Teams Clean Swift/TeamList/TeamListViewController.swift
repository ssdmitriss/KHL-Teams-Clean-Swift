//
//  TeamListViewController.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 09.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

protocol TeamListDisplayLogic: class {
    func displayTeams(viewModel: TeamList.fetchTeams.ViewModel)
}

class TeamListViewController: UITableViewController {
    
    var interactor: TeamListBusinessLogic?
    var router: (NSObjectProtocol & TeamListRoutingLogic & TeamListDataPassing)?
    
    private var teams: [TeamList.fetchTeams.ViewModel.DisplayedTeams] = []
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamListConfigurator.shared.configure(with: self)
        getTeams()
        configureNavigationBar(largeTitelColor: UIColor.white,
                               backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                               tintColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                               title: "Команды КХЛ",
                               prefferedLargeTitle: true)
        
        if teams.isEmpty == true {
            tableView.separatorStyle = .none
        }
        getTeams()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: Get teams
    func getTeams() {
        let request = TeamList.fetchTeams.Request()
        interactor?.fetchTeams(request: request)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        cell.configureCell(with: teams[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

//MARK: - TeamListDisplayLogic
extension TeamListViewController: TeamListDisplayLogic {
    func displayTeams(viewModel: TeamList.fetchTeams.ViewModel) {
        teams = viewModel.displayedTeams
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.separatorStyle = .singleLine
        }
    }
}


extension UITableViewController {
    func configureNavigationBar(largeTitelColor: UIColor,
                                backgroundColor: UIColor,
                                tintColor: UIColor,
                                title: String,
                                prefferedLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.backgroundColor = backgroundColor
            
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.compactAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.superview?.backgroundColor = .white
            navigationItem.title = title
            
        } else {
            // fallback on earlier virsion
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            navigationController?.view.backgroundColor = backgroundColor
        }
        
    }
}

