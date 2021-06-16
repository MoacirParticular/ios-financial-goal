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
    var buttonAction: (() -> Void)?
    
    // MARK: - Methods/ Functions
    
    override func loadView() {
        self.view = self.overrideView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ScreenAttributes.screenTitle
        getButtonAction()
        adjustKeyboardAppear()
    }

    private func getButtonAction() {
        overrideView.buttonAction = {
            self.buttonAction?()
            print("Hora de mudar de tela!")
        }
    }
    func adjustKeyboardAppear() {
        let height = 3 * (UIScreen.main.bounds.height / 5)
        NSLayoutConstraint.activate([
            self.view.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
