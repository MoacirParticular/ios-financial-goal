//
//  YearlyCoordinator.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 01/07/21.
//

import UIKit

public class YearlyCoordinator: Coordinator {
    let navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    public func start() {
        DispatchQueue.main.async {
            let yearlyViewController = YearlyViewController()
            self.navigation.pushViewController(yearlyViewController, animated: true)
        }
    }
}
