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
    var status: ((_ status: StatusSignIn) -> Void)?
    
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
            guard let passwd = self.overrideView.txtField.text else { return }
            if !passwd.isValidPassword {
                self.showDefaultAlert(.InvalidPassword, .NoPasswd)
                return
            }
            self.showActivity()
            self.requestApi(passwd) { (messageToAlert,status) in
                if status == true {
                    self.actionLogin(SignInData.username, passwd)
                    return
                }
                self.showAlertStatusSignIn(.Warning, messageToAlert, status)
            }
        }
    }
    
    private func actionLogin(_ user: String, _ pass: String) {
        let login = LoginViewModel()
        login.login(user, pass, self) { (returnApi) in
            if returnApi {
                self.status?(.Logged)
            }
        }
    }
    
    private func requestApi(_ passwd: String, completionHandler: @escaping(String,Bool) -> Void) {
        RequestSignIn().signIn(SignInData.username, SignInData.nickname, passwd) { (result) in
            var status = false
            switch(result) {
            case .success(let returnData):
                status = returnData.res ?? status
                guard let messsage = returnData.message else { return }
                completionHandler(messsage,status)
            case .failure(_ ):
                self.showDefaultAlert(.Warning, AlertMessage.NoConnection)
            }
        }
    }
    
    private func showAlertStatusSignIn(_ title: AlertTitle, _ message: String, _ status: Bool) {
        DispatchQueue.main.sync {
            let alert = UIAlertController(title: title.description, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: AlertButton.OK.rawValue, style: .default) { (action) in
                self.status?(self.setActionValue(message))
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            self.removeActivity()
        }
    }
    
    private func setActionValue(_ messageToAlert: String) -> StatusSignIn {
        if messageToAlert.contains(ComparationString.haveAccount) {
            return .Exists
        }
        return .Failure
    }
}


