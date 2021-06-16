//
//  LoginViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

  

import UIKit

class LoginViewController: UIViewController {
    
    
    //MARK: Propertys
    
    var loginView = LoginView(frame: .zero)
    let alertVC = AlertViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        getActionButton()
   
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    //MARK: Actions
    
    private func getActionButton() {
        loginView.onLoginButton = { option in
            var alert = self.alertVC.callAlertForgotPass()
            alert = self.alertVC.addAlertAtributes(alert: alert)
            self.present(alert, animated: true, completion: nil)
        }
    }

 
}

