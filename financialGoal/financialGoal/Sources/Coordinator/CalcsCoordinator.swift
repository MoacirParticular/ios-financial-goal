//
//  CalcsCoordinator.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//

import UIKit

public class CalcsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let calcsViewController = CalcsViewController()
        calcsViewController.onButtonCalcs = { setCalcs in
            switch setCalcs {
            case .Monthly:
                let coordinator = MonthlyCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .Yearly:
                let coordinator = LoginCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .Taxes:
                let coordinator = TaxesCoordinator(navigationController: self.navigationController)
                coordinator.start()
            }
        }
        self.navigationController.pushViewController(calcsViewController, animated: true)
    }
}
