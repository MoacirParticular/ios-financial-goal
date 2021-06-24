//
//  SignInNameCoordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 16/06/21.
//

import UIKit

public class SignInNameCoordinator: Coordinator {
    let navigationController: UINavigationController
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenViewController = SignInNameViewController()
        screenViewController.buttonAction = {
            let newVc = SignInPasswdCoordinator(navigationController: self.navigationController)
            newVc.start()
        }
        self.navigationController.pushViewController(screenViewController, animated: true)
        
    }
}
