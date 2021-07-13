//
//  SignInMailView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/06/21.
//

import UIKit

class SignInMailView: UIView {
    
    // MARK: - Attributes
    var buttonAction: (() -> Void)?
    
    // MARK: - Label
    lazy var lbSubtitle: UILabel = {
        let label = LabelComponent(.fontLabelTitleRegular, ValuesSignIn_Mail.subtitile)
        label.numberOfLines = StaticConfigLabel.subtitleNumberOfLines
        return label
    }()
    lazy var lbDescription: UILabel = {
        LabelComponent(.fontLabelSubTitleRegular, ValuesSignIn_Mail.description,
                       .customColorPageControl)
    }()
    
    // MARK: - TextField
    lazy var txtField: UITextField = {
       let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.backgroundColor = .customColorTextField
        tField.layer.cornerRadius = ConstantsTextField.cornerRadius
        tField.addShadow()
        tField.keyboardType = UIKeyboardType.emailAddress
        tField.placeholder = ValuesSignIn_Mail.placeholder
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }()
    
    // MARK: - Button
    lazy var bttnContinue: UIButton = {ButtonComponent(title: ValuesSignIn_Mail.buttonTitle, background: .blackCustomGoal, colorTitle: .customColorTextButton, font: .fontButtonsBlack, radius: ValuesConstraintsButton.radiusValue)}()
    
    // MARK: - Methods/ Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
    
    private func createView() {
        self.backgroundColor = .backgroundCustomGoal
        alignLbSubtitle()
        alignLbDescription()
        alignTxtField()
        alignBttnContinue()
    }
    
    // MARK: - ButtonAction
    @objc private func receiveActionButton(sender: UIButton!) {
        self.buttonAction?()
    }
    
    // MARK: - Constraints
    private func alignLbSubtitle() {
        self.addSubview(lbSubtitle)
        NSLayoutConstraint.activate([
            lbSubtitle.safeAreaLayoutGuide.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: ValuesConstraintsLabel.identTop),
            lbSubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ValuesConstraintsLabel.identLeft),
            lbSubtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: ValuesConstraintsLabel.identRight)
        ])
    }
    
    private func alignLbDescription() {
        self.addSubview(lbDescription)
        NSLayoutConstraint.alignDefaultLabels(lbDescription, lbSubtitle.bottomAnchor, self)
    }
    
    private func alignTxtField() {
        self.addSubview(txtField)
        NSLayoutConstraint.alignDefault(txtField, lbDescription.bottomAnchor, self)
        NSLayoutConstraint.activate([
            txtField.heightAnchor.constraint(equalToConstant: ConstantsTextField.height)
        ])
    }
    
    private func alignBttnContinue() {
        bttnContinue.addTarget(self, action: #selector(receiveActionButton), for: .touchUpInside)
        self.addSubview(bttnContinue)
        NSLayoutConstraint.alignDefaultButton(bttnContinue, self)
        NSLayoutConstraint.activate([
            
        ])
    }
}
