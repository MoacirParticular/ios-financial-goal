//
//  AlertView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 16/06/21.
//

import UIKit

class AlertViewController: UIAlertController {
    
    func alertView(view: UIViewController) -> UIAlertController {
        let alert = UIAlertController(title: StringContantsAlertForgotPass.title, message: StringContantsAlertForgotPass.message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .emailAddress
            textField.placeholder = StringContantsAlertForgotPass.placeHolderTF
        }
        let cancel = UIAlertAction(title: StringContantsAlertForgotPass.actiontitleCancel, style: .cancel, handler: nil)
        alert.addAction(cancel)
        let ok = UIAlertAction(title: StringContantsAlertForgotPass.actiontitleOK, style: .default) { (action) in
            view.showActivity()
            guard let username = alert.textFields?.first?.text else { return }
            if username.isValidEmail {
                DispatchQueue.main.async {
                    self.requestAlert(view: view, username: username)
                }
                return
            }
            self.showAlertError(view: view, .Warning, .MailError)
        }
        alert.addAction(ok)
        return alert
    }
    
    func requestAlert(view: UIViewController, username: String) {
        RequestRecoveryPass().recoveryPass(username) { (result) in
            switch (result) {
            case .success(let userData):
                guard let message = userData.message else { return }
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: AlertTitle.DearUser.description, message: message, preferredStyle: .alert)
                    let ok = UIAlertAction(title: AlertButton.OK.rawValue, style: .default)
                    alert.addAction(ok)
                    view.present(alert, animated: true, completion: nil)
                    view.removeActivity()
                }
            case .failure( _):
                self.showAlertError(view: view, .Warning, .NoConnection)
            }
        }
    }
    
    func showAlertError(view: UIViewController, _ title: AlertTitle, _ message: AlertMessage) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title.description, message: message.description, preferredStyle: .alert)
            let ok = UIAlertAction(title: AlertButton.OK.rawValue, style: .default) { (action) in
                let alert = self.alertView(view: view)
                view.present(alert, animated: true, completion: nil)
            }
            alert.addAction(ok)
            view.present(alert, animated: true, completion: nil)
            view.removeActivity()
        }
    }
}
