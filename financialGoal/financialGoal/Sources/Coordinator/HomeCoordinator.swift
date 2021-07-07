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
            homeViewController.onScreenSelected = { setSelected in
                switch setSelected {
                case .Calcs:
                    let calcs = CalcsCoordinator(navigationController: self.navigationController)
                    calcs.start()
                case .Logout:
                    CrudUserDefaults().delete()
                    let startScreen = StartCoordinator(navigationController: self.navigationController)
                    startScreen.start()
                case .Simulator:
                    homeViewController.showDefaultAlert(.Warning, .SimulatorUnavailable)
                default:
                    break
                }
            }
            
            homeViewController.onButtonActionView = {setSelected in
                if setSelected == CalcsTypesScreen.Monthly.stringValue{
                    let screen = MonthlyCoordinator(navigationController: self.navigationController)
                    screen.start()
                }
                if setSelected == CalcsTypesScreen.Yearly.stringValue{
                    let screen = YearlyCoordinator(navigationController: self.navigationController)
                    screen.start()
                }
                if setSelected == CalcsTypesScreen.Taxes.stringValue{
                    let screen = TaxesCoordinator(navigationController: self.navigationController)
                    screen.start()
                }
            }
        
            self.navigationController.pushViewController(homeViewController, animated: true)
        }
    }
}
