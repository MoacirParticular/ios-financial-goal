//
//  StartCoordinator.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import UIKit

class StartCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
//    func callAutoLogin(){
//        var user = String.empty
//        var pass = String.empty
//        var containCredential:Bool = false
//        
//        if let userKey = UserDefaults.standard.value(forKey: StringConstants.userKey) as? String{
//            user = userKey
//            if let passKey = UserDefaults.standard.value(forKey: StringConstants.passKey) as? String{
//                pass = passKey
//                containCredential = true
//            }
//        }
//        if containCredential{
//            requestLogin().login(user, pass) { (result) in
//                switch(result) {
//                case .success(let returnData):
//                    guard let nickNameLogado = returnData.user?.nickname else {return}
//                    if returnData.res == true {
//                        SignInData.nickname = nickNameLogado
//                        self.onLoginButton?(.AutoLogin)
//                    }
//                case .failure( _):
//                    self.showDefaultAlert(.Warning, AlertMessage.NoConnection)
//                }
//            }
//        }
//    }
//    
    func start() {
        
//        if let userKey = UserDefaults.standard.value(forKey: StringConstants.userKey) as? String {
//            if let passKey = UserDefaults.standard.value(forKey: StringConstants.passKey) as? String {
//
//            }
//        }
        let loggedOutViewController = LoggedOutViewController()
        
        loggedOutViewController.onLoginButton = { setLogin in
            switch setLogin {
            case .CreateAccount:
                let coordinator = SignInCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .Login:
                let coordinator = LoginCoordinator(navigationController: self.navigationController)
                coordinator.start()
            case .AutoLogin:
                let coordinator = HomeCoordinator(navigationController: self.navigationController)
                coordinator.start()
            }
        }
        self.navigationController.pushViewController(loggedOutViewController, animated: true)
    }
}
