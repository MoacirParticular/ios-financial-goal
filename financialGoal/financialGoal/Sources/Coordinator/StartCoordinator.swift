//
//  StartCoordinator.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import Foundation
import UIKit

public class StartCoordinator: Coordinator {
    let navigationController: UINavigationController
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenViewController = SignInViewController()
        
        screenViewController.buttonAction = {
            let signIn2Coordinator = SignIn2Coordinator(navigationController: self.navigationController)
            signIn2Coordinator.start()
        }
        self.navigationController.pushViewController(screenViewController, animated: true)
        
    }
}
