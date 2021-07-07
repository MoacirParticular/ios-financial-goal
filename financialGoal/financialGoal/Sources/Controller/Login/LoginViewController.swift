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
                self.requestLogin(username, password)
            } else{
                self.showDefaultAlert(.InvalidPassword, .NoPasswd)
            }
        }else{
            self.showDefaultAlert(.InvalidMail, .MailError)
        }
    }
    
    //MARK: Resposta da API com alert ou direcionando para home
    private func requestLogin(_ username: String, _ password:String) {
        self.showActivity()
        let login = LoginViewModel()
        login.login(username, password, self) { (resApi) in
            if resApi {
                self.setViewHome?(.Logado)
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

