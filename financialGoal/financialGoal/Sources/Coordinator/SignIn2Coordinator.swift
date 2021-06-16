//
//  SignIn2Coordinator.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 16/06/21.
//

import Foundation
import UIKit

public class SignIn2Coordinator: Coordinator {
    let navigationController: UINavigationController
   
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let screenViewController = SignInViewController()
        self.navigationController.pushViewController(screenViewController, animated: true)
        
    }
}
