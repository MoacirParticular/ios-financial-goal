//
//  StartCoordinator.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import UIKit

class StartCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
  
    func start() {
        let loggedOutViewController = LoggedOutViewController()
        
        loggedOutViewController.onLoginButton = { setLogin in
            switch setLogin {
            case .CreateAccount:
                let coordinator = SignInCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .Login:
                let coordinator = LoginCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .AutoLogin:
                let coordinator = HomeCoordinator(navigationController: self.navigationController)
                coordinator.start()
            }
        }
        self.navigationController.pushViewController(loggedOutViewController, animated: true)
    }
}
