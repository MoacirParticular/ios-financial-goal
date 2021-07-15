//
//  SignInMailViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/06/21.
//

import UIKit

class SignInMailViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInMailView(frame: FrameConstants.frameZero)
    var buttonAction: (() -> Void)?
    let userDefaults = CrudUserDefaults()
    
    // MARK: - Methods/ Functions
    override func loadView() {
        dataRecover()
        self.view = self.overrideView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: ScreenAttributes.screenTitle )
        getButtonAction()
        listennerKeyBoard()
    }
    
    private func dataRecover() {
        overrideView.txtField.text = self.userDefaults.getUserCredentials().last
    }
    
    private func getButtonAction() {
        overrideView.buttonAction = {
            guard let receivedMail = self.overrideView.txtField.text?.lowercased() else { return }
            if self.checkMail(receivedMail) {
                self.userDefaults.save(receivedMail, String.empty)
                self.buttonAction?()
            } else {
                self.showDefaultAlert(.InvalidMail, .MailError)
            }
        }
    }
    
    private func checkMail(_ username: String) -> Bool {
        return username.isValidEmail
    }
}

