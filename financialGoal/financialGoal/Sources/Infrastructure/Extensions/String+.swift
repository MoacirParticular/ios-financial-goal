//
//  String+.swift
//  financialGoal
//
//  Created by Moacir Lamego on 14/06/21.
//

import UIKit

extension String {
    static let empty = String()
}

extension String {
    var isValidEmail: Bool { return mailValidator(self) }
    
    func mailValidator(_ email: String) -> Bool {
        let emailChars = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailChars)
        return emailPred.evaluate(with: email)
    }
}
