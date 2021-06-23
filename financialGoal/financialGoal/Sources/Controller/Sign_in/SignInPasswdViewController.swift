//
//  SignInPasswdViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

class SignInPasswdViewController: UIViewController {
    
    // MARK: - Attributes
    let overrideView = SignInPasswdView(frame: FrameConstants.frameZero)
    var buttonAction: (() -> Void)?
    
    // MARK: - Methods/ Functions
    override func loadView() {
        self.view = self.overrideView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: ScreenAttributes.screenTitle )
        getButtonAction()
        listennerKeyBoard()
    }
    
    private func getButtonAction() {
        overrideView.buttonAction = {
            if let passwd = self.overrideView.txtField.text {
                if self.checkPassword(passwd) {
                    self.requestApi(passwd) { (messageToAlert) in
                        self.showAlert(.DearUser, messageToAlert)
                        if messageToAlert.contains("já cadastrado") {
                            
                        }
                        self.buttonAction?()
                    }
                } else {
                    self.showDefaultAlert(.Warning, .NoPasswd)
                }
            }
        }
    }
    
    private func checkPassword(_ password: String) -> Bool {
        if password != String.empty {
            return true
        }
        return false
    }
    
    private func requestApi(_ passwd: String, completionHandler: @escaping(String) -> Void) {
        RequestSignIn().signIn(SignInData.username, SignInData.nickname, passwd) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                completionHandler(messsage)
            case .failure(let error):
                completionHandler(error.localizedDescription)
            }
        }
    }
}


