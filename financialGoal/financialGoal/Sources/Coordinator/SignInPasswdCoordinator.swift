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
        screenViewController.status = { status in
            switch status {
            case .Failure:
                break
            case .Exists:
                DispatchQueue.main.async {
                    repeat {
                        self.navigationController.viewControllers.removeLast()
                    } while self.navigationController.viewControllers.count > ElementsInNavigation.one
                    let login = LoginCoordinator(navigationController: self.navigationController)
                    login.startToSignIn()
                }
            case .Logged:
                DispatchQueue.main.async {
                    self.navigationController.viewControllers.removeAll()
                    let homeLogged = HomeCoordinator(navigationController: self.navigationController)
                    homeLogged.start()
                }
                
            }
        }
        self.navigationController.pushViewController(screenViewController, animated: true)
    }
}
