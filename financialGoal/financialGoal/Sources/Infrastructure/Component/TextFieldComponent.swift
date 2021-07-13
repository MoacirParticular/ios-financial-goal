//
//  TextFieldComponent.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 08/07/21.
//

import Foundation

import UIKit

class TextFieldComponent: UITextField {
    
    init(_ fontStyle: UIFont = .fontLabelCalc,
         _ keyboardType: UIKeyboardType = UIKeyboardType.numberPad,
         _ textColor: UIColor = .customColorResultTaxes,
         _ frameL: CGRect = .zero,
         _ backgroundColor: UIColor = .customColorTextField,
         _ cornerRadius:CGFloat = ConstantsConstraintsLogin.cornerRadiusTF)
    {
        super.init(frame: frameL)
        self.font = fontStyle
        self.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.keyboardType = keyboardType
        self.layer.cornerRadius = cornerRadius
        self.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        self.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

