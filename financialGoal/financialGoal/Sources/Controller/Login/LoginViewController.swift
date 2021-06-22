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
                self.setResultTextField()
                
            default:
                let alert = self.alertVC.alertView()
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func setResultTextField() {
        guard let username = self.loginView.textFieldUser.text else { return }
        guard let password = self.loginView.textFieldPassword.text else { return }
        self.requestApi(username, password)
    }
    
    private func requestApi(_ username: String, _ password:String) {
        requestLogin().login(username, password) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                
                if returnData.res == true {
                    print("PROXIMA TELA")
                    self.setViewHome?(.Logado)
                }else{
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Login", message: messsage, preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
                            
                        }
                        alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

