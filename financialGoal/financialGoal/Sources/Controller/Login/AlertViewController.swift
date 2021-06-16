//
//  AlertView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 16/06/21.
//

import UIKit



class AlertViewController: UIAlertController {
    
    func addAlertAtributes(alert: UIAlertController) -> UIAlertController{
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addTextField { (email) in
        email.keyboardType = .emailAddress
        email.placeholder = alertPlaceHolderTF
        }
        let cancel = UIAlertAction(title: alertActiontitleCancel, style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: alertActiontitleOK, style: .default) {
         (action) in
            guard let email = alert.textFields?[0].text else {return}
            print(email)
        }
        alert.addAction(ok)
            return alert
        }
    
    func callAlertForgotPass() -> UIAlertController{

        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: alertActiontitleOK, style: .default)
        alert.addAction(ok)
        return alert
    }
}

