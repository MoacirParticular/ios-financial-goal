//
//  IndexCoordinator.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 05/07/21.
//


import UIKit

public class IndexCoordinator: Coordinator {
    let navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    public func start() {
        DispatchQueue.main.async {
            let indexViewController = IndexViewController()
            self.navigation.pushViewController(indexViewController, animated: true)
        }
    }
}
