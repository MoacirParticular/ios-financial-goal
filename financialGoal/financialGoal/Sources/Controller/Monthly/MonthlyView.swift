//
//  MonthlyView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

class MonthlyView: UIView {
    var buttonAction: (() -> Void)?
    
    // MARK: - Label
    lazy var lbFirst: UILabel = { createLabel() }()
    lazy var lbSecond: UILabel = { createLabel() }()
    lazy var lbThird: UILabel = { createLabel() }()
    lazy var lbFourth: UILabel = { createLabel() }()
    lazy var lbFifth: UILabel = { createLabel() }()
    
    // MARK: - TextField
    lazy var tfFirst: UITextField = { createTextField() }()
    lazy var tfSecond: UITextField = { createTextField() }()
    lazy var tfThird: UITextField = { createTextField() }()
    lazy var tfFourth: UITextField = { createTextField() }()
    lazy var tfFifth: UITextField = { createTextField() }()
    
    // MARK: - Button
    let bttnCalcular: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        bttn.setTitleColor(.white, for: .normal)
        bttn.titleLabel?.font = .fontButtonsBlack
        bttn.setTitle(ValuesSignIn_Mail.buttonTitle, for: .normal)
//        bttn.addTarget(self, action: #selector(receiveActionButton), for: .touchUpInside)
        return bttn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundCustomGoal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = .fontLabelCalc
        UIView.configInitailElements(label)
        return label
    }
    
    
    private func createTextField() -> UITextField {
        let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.backgroundColor = .customColorTextField
        tField.layer.cornerRadius = ConstantsTextField.cornerRadius
        tField.addShadow()
        tField.keyboardType = UIKeyboardType.emailAddress
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }
}
