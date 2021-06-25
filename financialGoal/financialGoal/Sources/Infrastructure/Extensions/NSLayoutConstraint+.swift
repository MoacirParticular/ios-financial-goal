//
//  NSLayoutConstraint+.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 16/06/21.
//

import UIKit

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
    
    @objc static func alignDefaultLabelObservation(_ viewElement: UIView, _ viewReference: NSLayoutYAxisAnchor, _ viewBase: UIView) {
        NSLayoutConstraint.activate([
            viewElement.topAnchor.constraint(equalTo: viewReference, constant: ValuesConstraintsLabel.identObservationTop),
            viewElement.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: ValuesConstraintsLabel.identLeft),
            viewElement.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor, constant: ValuesConstraintsLabel.identRight)
        ])
    }
    
    @objc static func alignDefaultButton(_ viewElement: UIView, _ viewReferenceBase: UIView) {
        NSLayoutConstraint.activate([
            viewElement.bottomAnchor.constraint(equalTo: viewReferenceBase.bottomAnchor, constant: ValuesConstraintsButton.identBotton),
            viewElement.leadingAnchor.constraint(equalTo: viewReferenceBase.leadingAnchor, constant: ValuesConstraintsButton.identLeft),
            viewElement.trailingAnchor.constraint(equalTo: viewReferenceBase.trailingAnchor, constant: ValuesConstraintsButton.identRight),
            viewElement.heightAnchor.constraint(equalToConstant: ValuesConstraintsButton.height)
        ])
    }
}
