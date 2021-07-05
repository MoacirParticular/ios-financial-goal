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
    
    // MARK: - Methods/ Functions
    override func loadView() {
        dataRecover()
        self.view = self.overrideView
        dataRestore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: ScreenAttributes.screenTitle )
        getButtonAction()
        listennerKeyBoard()
    }
    
    private func dataRecover() {
        overrideView.txtField.text = SignInData.username
    }
    
    private func getButtonAction() {
        overrideView.buttonAction = {
            guard let receivedMail = self.overrideView.txtField.text?.lowercased() else { return }
            if self.checkMail(receivedMail) {
                SignInData.username = receivedMail
                self.buttonAction?()
            } else {
                self.showDefaultAlert(.InvalidMail, .MailError)
            }
        }
    }
    
    private func checkMail(_ username: String) -> Bool {
        return username.isValidEmail
    }
    
    private func dataRestore() {
        SignInData.username = String.empty
        SignInData.nickname = String.empty
    }
}

