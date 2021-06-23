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
                let alert = self.alertVC.alertView()
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: Checa os dados digitados no textField
    private func checkDataTextField(){
        guard let password = self.loginView.textFieldPassword.text else { return }
        guard let username = self.loginView.textFieldUser.text else { return }
        if password != String.empty{
            self.requestApi(username, password)
        } else{
            self.setAlert("Atenção", "Informe uma senha valida", "Ok")
        }
    }
    
    //MARK: Alert padrão
    func setAlert(_ title: String, _ message: String, _ titleResult: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: titleResult, style: .default) { (action) in
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    //MARK: Resposta da API com alert ou direcionando para home
    private func requestApi(_ username: String, _ password:String) {
        requestLogin().login(username, password) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                
                //Leva o usuario para home caso a resposta seja true
                if returnData.res == true {
                    self.setViewHome?(.Logado)
                }else{
                    self.setAlert("Login", messsage, "Ok")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

