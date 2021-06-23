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
            if password != String.empty{
                self.requestApi(username, password)
            } else{
                self.showDefaultAlert(.Warning, .NoPasswd)
            }
        }else{
            self.showDefaultAlert(.Warning, .MailError)
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
                    self.showAlert(.DearUser, messsage)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

fileprivate var aView : UIView?

extension UIViewController {
    
    func showActivity() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view?.addSubview(aView!)
      
    }
    
    func removeActivity(){
        aView?.removeFromSuperview()
        aView = nil
    }
}

