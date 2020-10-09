//
//  TeamDetailsViewController.swift
//  KHL Teams Clean Swift
//
//  Created by Дмитрий Селезнев on 08.10.2020.
//  Copyright (c) 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

protocol TeamDetailsDisplayLogic: class {
    func displayDetails(viewModel: TeamDetails.ShowDetails.ViewModel)
}

class TeamDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var logoTeam: ImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var conference: UILabel!
    
    var interactor: TeamDetailsBusinessLogic?
    var router: (NSObjectProtocol & TeamDetailsRoutingLogic & TeamDetailsDataPassing)?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
    }
    
    func showDetails() {
        let request = TeamDetails.ShowDetails.Request()
        interactor?.showDetails(request: request)
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = TeamDetailsInteractor()
        let presenter = TeamDetailsPresenter()
        let router = TeamDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension TeamDetailsViewController: TeamDetailsDisplayLogic {
    
    func displayDetails(viewModel: TeamDetails.ShowDetails.ViewModel) {
        nameTeam.text = viewModel.displayedDetails.teamName
        city.text = viewModel.displayedDetails.city
        conference.text = viewModel.displayedDetails.confirence
        logoTeam.fetchImage(with: viewModel.displayedDetails.logoTeam)
    }
}
