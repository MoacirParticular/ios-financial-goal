//
//  ExtensionUsed.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 15/06/21.
//

import UIKit

extension UITextField {
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: ShadowTextField.shadowWidth, height: ShadowTextField.shadowHeight)
        self.layer.shadowRadius = ShadowTextField.shadowRadius
        self.layer.shadowOpacity = ShadowTextField.shadowOpacity
    }
}

extension UIView {
    static func configInitailElements(_ viewElement: UIView) {
        viewElement.translatesAutoresizingMaskIntoConstraints = false
        viewElement.frame = .zero
    }
}

extension NSLayoutConstraint {
    @objc static func alignDefault(_ viewElement: UIView, _ viewReference: NSLayoutYAxisAnchor, _ viewBase: UIView) {
        NSLayoutConstraint.activate([
            viewElement.topAnchor.constraint(equalTo: viewReference, constant: ValuesConstraintsTextField.identTop),
            viewElement.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: ValuesConstraintsTextField.identLeft),
            viewElement.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor, constant: ValuesConstraintsTextField.identRight)
        ])
    }
    @objc static func alignDefaultLabels(_ viewElement: UIView, _ viewReference: NSLayoutYAxisAnchor, _ viewBase: UIView) {
        NSLayoutConstraint.activate([
            viewElement.topAnchor.constraint(equalTo: viewReference, constant: ValuesConstraintsLabel.identTop),
            viewElement.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: ValuesConstraintsLabel.identLeft),
            viewElement.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor, constant: ValuesConstraintsLabel.identRight)
        ])
    }
    @objc static func alignDefaultButton(_ viewElement: UIView, _ viewReferenceBase: UIView) {
        NSLayoutConstraint.activate([
            viewElement.bottomAnchor.constraint(equalTo: viewReferenceBase.bottomAnchor, constant: ValuesConstraintsButton.identBotton),
            viewElement.leadingAnchor.constraint(equalTo: viewReferenceBase.leadingAnchor, constant: ValuesConstraintsButton.identLeft),
            viewElement.trailingAnchor.constraint(equalTo: viewReferenceBase.trailingAnchor, constant: ValuesConstraintsButton.identRight)
        ])
    }
}

extension UIColor {
    static let descriptioneColor: UIColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 1)
}

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
}
