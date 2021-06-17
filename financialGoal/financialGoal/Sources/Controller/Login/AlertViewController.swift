//
//  AlertView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 16/06/21.
//

import UIKit



class AlertViewController: UIAlertController {

    
    func addAlertAtributes() -> UIAlertController{
        
        let alert = UIAlertController(title: ConstantLogin.alertTitle, message: ConstantLogin.alertMessage, preferredStyle: .alert)
        alert.addTextField { (email) in
            email.keyboardType = .emailAddress
            email.placeholder = ConstantLogin.alertPlaceHolderTF
        }
        let cancel = UIAlertAction(title: ConstantLogin.alertActiontitleCancel, style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: ConstantLogin.alertActiontitleOK, style: .default) {
         (action) in
            guard let email = alert.textFields?[0].text else {return}
            print(email)
        }
        alert.addAction(ok)
    return alert
    }
}
