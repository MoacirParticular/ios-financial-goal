//
//  ConstraintsConstants.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 15/06/21.
//

import UIKit

struct ConstantsConstraintsLogin {
    static let leftTFUsername:CGFloat = 16
    static let rightTFUsername:CGFloat = -16
    static let heightTFUsername:CGFloat = 60
    static let widthTFUsername:CGFloat = 10
    static let cornerRadiusTF:CGFloat = 9
    static let topAnchorTFusername:CGFloat = 36
    static let maskIntoConstraints:Bool = false
    static let constantIsSecureTextEntry:Bool = true
}

struct ConstantsConstraintsPassword {
    static let leftTFPassword:CGFloat = 16
    static let rightTFPassword:CGFloat = -16
    static let heightTFPassword:CGFloat = 60
    static let topAnchorPassword:CGFloat = 1
}

struct ConstantsConstraintsBtLogin {
    static let cornerRadiusButton:CGFloat = 6
    static let topAnchorbtLogin:CGFloat = 22
    static let leftAnchorBtLogin:CGFloat = 16
    static let rightAnchorBtLogin:CGFloat = -16
    static let heightAnchorbtLogin:CGFloat = 52
    static let frameBtLogin:CGRect = .zero
}

struct ConstantsConstraintsBtForgetPass {
    static let topAnchorBtForgotPass:CGFloat = 22
    static let leftAnchorBtForgotPass:CGFloat = 16
    static let rightAnchorBtForgotPass:CGFloat = -13
    static let heightAnchorBtForgotPass:CGFloat = 52
    static let frameBtForgotPass:CGRect = .zero
}
