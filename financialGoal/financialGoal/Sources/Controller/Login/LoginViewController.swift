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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
   
    }
    
    override func loadView() {
        self.view = loginView
    }
    
}
