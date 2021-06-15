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
        self.title = ScreenAttributes.screenTitle
        adjustKeyboardAppear()
    }

    func adjustKeyboardAppear() {
        let height = 3 * (UIScreen.main.bounds.height / 5)
        NSLayoutConstraint.activate([
            self.view.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
