//
//  LoginCoordinator.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//


import UIKit

public class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    let screenLoginViewController = LoginViewController()
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        actionCoordinator(true)
    }
    
    public func startToSignIn() {
        self.navigationController.navigationBar.topItem?.backButtonTitle = StringConstantsLogin.screenTitleLogin
        actionCoordinator(false)
    }
    
    private func actionCoordinator(_ animated: Bool) {
        screenLoginViewController.setViewHome = { action in
            if action == .Logado {
                DispatchQueue.main.async {
                    self.navigationController.viewControllers.removeAll()
                }
                let home = HomeCoordinator(navigationController: self.navigationController)
                home.start()
            }
        }
        self.navigationController.pushViewController(screenLoginViewController, animated: animated)
    }
}
