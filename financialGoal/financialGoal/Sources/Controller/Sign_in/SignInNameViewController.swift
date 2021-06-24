//
//  SignInNameViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

class SignInNameViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInNameView(frame: FrameConstants.frameZero)
    var buttonAction: (() -> Void)?
    
    // MARK: - Methods/ Functions
    override func loadView() {
        dataRecover()
        self.view = self.overrideView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: ScreenAttributes.screenTitle)
        getButtonAction()
        listennerKeyBoard()
    }
    
    private func dataRecover() {
        overrideView.txtField.text = SignInData.nickname
    }
    
    private func getButtonAction() {
        overrideView.buttonAction = {
            if let receivedNickname = self.overrideView.txtField.text {
                if self.checkNickname(receivedNickname) {
                    SignInData.nickname = receivedNickname
                    self.buttonAction?()
                } else {
                    self.showDefaultAlert(.Warning, .NoNickname)
                }
            }
        }
    }
    
    private func checkNickname(_ nickname: String) -> Bool {
        if nickname != String.empty {
            return true
        }
        return false
    }
}
