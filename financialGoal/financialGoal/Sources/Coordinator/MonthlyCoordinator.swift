//
//  MonthlyCoordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

public class MonthlyCoordinator: Coordinator {
    let navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    public func start() {
        DispatchQueue.main.async {
            let screenViewController = MonthlyViewController()
            self.navigation.pushViewController(screenViewController, animated: true)
        }
    }
    
    
}
