//
//  SignInPasswdCoordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

public class SignInPasswdCoordinator: Coordinator {
    let navigationController: UINavigationController
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenViewController = SignInPasswdViewController()
        
        screenViewController.buttonAction = {
            // 
        }
        self.navigationController.pushViewController(screenViewController, animated: true)
        
    }
}
