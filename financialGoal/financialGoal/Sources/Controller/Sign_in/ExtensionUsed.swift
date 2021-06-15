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
        self.layer.shadowOffset = CGSize(width: -6, height: 4)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.1
    }
}

extension UIView {
    static func configInitailElements(_ viewElement: UIView) {
        viewElement.translatesAutoresizingMaskIntoConstraints = false
        viewElement.frame = .zero
    }
}
