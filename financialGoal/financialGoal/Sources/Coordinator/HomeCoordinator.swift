//
//  HomeCoordinator.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 22/06/21.
//

import UIKit

public class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        DispatchQueue.main.async {
            let homeViewController = HomeViewController()
            homeViewController.onScreenSelected = {setSelected in
                switch setSelected {
                case .Calcs:
                    let calcs = CalcsCoordinator(navigationController: self.navigationController)
                    calcs.start()
                case .Simulator:
                    homeViewController.showDefaultAlert(.Warning, .SimulatorUnavailable)
                default:
                    break
                }
            }
            self.navigationController.pushViewController(homeViewController, animated: true)
        }
    }
}
