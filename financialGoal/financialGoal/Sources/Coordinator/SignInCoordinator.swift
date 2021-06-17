//
//  SignInCoordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 16/06/21.
//

import Foundation
import UIKit

public class SignInCoordinator: Coordinator {
    let navigationController: UINavigationController
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenViewController = SignInViewController()
        
        screenViewController.buttonAction = {
            let newVc = SignInCoordinator(navigationController: self.navigationController)
            newVc.start()
        }
        self.navigationController.pushViewController(screenViewController, animated: true)
        
    }
}
