//
//  LoginViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

  

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Proprieties:
    var loginView = LoginView(frame: .zero)
    let alertVC = AlertViewController()
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        getActionButton()
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    //MARK: Actions Buttons:
    private func getActionButton() {
        loginView.onLoginButton = { option in
            switch option {
            case .Login:
                print("Tentando Login")
            default:
                let alert = self.alertVC.alertView()
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

