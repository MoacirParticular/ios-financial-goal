//
//  TaxesCoordinator.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//

import UIKit

public class TaxesCoordinator: Coordinator {
    let navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    public func start() {
        DispatchQueue.main.async {
            let taxesViewController = TaxesViewController()
            self.navigation.pushViewController(taxesViewController, animated: true)
        }
    }
}
