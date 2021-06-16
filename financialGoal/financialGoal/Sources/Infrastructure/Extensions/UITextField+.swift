//
//  UITextField+.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 16/06/21.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: ShadowTextField.shadowWidth, height: ShadowTextField.shadowHeight)
        self.layer.shadowRadius = ShadowTextField.shadowRadius
        self.layer.shadowOpacity = ShadowTextField.shadowOpacity
    }
}
