//
//  SignIn.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/06/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInView(frame: .zero)
    
    // MARK: - Methods/ Functions
    
    override func loadView() {
        self.view = self.overrideView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "asdsadsa"
    }
}
