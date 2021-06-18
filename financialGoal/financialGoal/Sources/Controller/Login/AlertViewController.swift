//
//  AlertView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 16/06/21.
//

import UIKit

class AlertViewController: UIAlertController {

    func alertView() -> UIAlertController{
        let alert = UIAlertController(title: StringContantsAlertForgotPass.title, message: StringContantsAlertForgotPass.message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .emailAddress
            textField.placeholder = StringContantsAlertForgotPass.placeHolderTF
        }
        let cancel = UIAlertAction(title: StringContantsAlertForgotPass.actiontitleCancel, style: .cancel, handler: nil)
        alert.addAction(cancel)
        let ok = UIAlertAction(title: StringContantsAlertForgotPass.actiontitleOK, style: .default) {
         (action) in
            guard let email = alert.textFields?[0].text else {return}
            print(email)
        }
        alert.addAction(ok)
        return alert
    }
}
