//
//  LoginViewModel.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import UIKit

final class LoginViewModel {
    
    func login(_ username: String, _ password:String, _ viewC: UIViewController, completion: @escaping(Bool) -> Void) {
        requestLogin().login(username, password) { (result) in
            switch(result) {
            case .success(let returnData):
                guard let messsage = returnData.message else { return }
                if returnData.res == true {
                    let user = returnData.user?.username ?? String.empty
                    let nick = returnData.user?.nickname ?? String.empty
                    KeychainService.saveCredentials(user: username, pass: password)
                    CrudUserDefaults().save(user, nick)
                    completion(true)
                } else {
                    viewC.showAlert(.Warning, messsage)
                    completion(false)
                }
            case .failure( _):
                viewC.showDefaultAlert(.Warning, AlertMessage.NoConnection)
                completion(false)
            }
        }
    }
}
