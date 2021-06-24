//
//  LoginViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//


import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Proprieties:
    var loginView = LoginView(frame: FrameConstants.frameZero)
    let alertVC = AlertViewController()
    
    var setViewHome: ((_ login: LoginActionType) -> Void)?
        
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        getActionButton()
        navigationTitleConfig(title: StringConstantsLogin.screenTitleLogin )
        self.dataRecover()
    }
    
    override func loadView() {
        self.view = loginView
        
    }
    
    //MARK: Actions Buttons:
    private func getActionButton() {
        loginView.onLoginButton = { option in
            switch option {
            case .Login:
                self.checkDataTextField()
            default:
                let alert = self.alertVC.alertView(view: self)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: Checa os dados digitados no textField
    private func checkDataTextField(){
        guard let password = self.loginView.textFieldPassword.text else { return }
        guard let username = self.loginView.textFieldUser.text?.lowercased() else { return }
        if username.isValidEmail{
            if password.isValidPassword {
                self.requestApi(username, password)
            } else{
                self.showDefaultAlert(.InvalidPassword, .NoPasswd)
            }
        }else{
            self.showDefaultAlert(.InvalidMail, .MailError)
        }
    }
    
    //MARK: Resposta da API com alert ou direcionando para home
    private func requestApi(_ username: String, _ password:String) {
        self.showActivity()
        requestLogin().login(username, password) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                
                //Leva o usuario para home caso a resposta seja true
                if returnData.res == true {
                    self.setViewHome?(.Logado)
                }else{
                    self.showAlert(.Warning, messsage)
                }
            case .failure(let error):
                self.showDefaultAlert(.Warning, AlertMessage.NoConnection)
            }
        }
    }
    
    private func dataRecover() {
            loginView.textFieldUser.text = SignInData.username
            self.dataRestore()
        }
        
        private func dataRestore() {
            SignInData.username = String.empty
            SignInData.nickname = String.empty
        }
    
}

