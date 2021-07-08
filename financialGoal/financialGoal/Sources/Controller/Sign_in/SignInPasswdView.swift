//
//  SignInPasswdView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

class SignInPasswdView: UIView {
    
    // MARK: - Attributes
    var buttonAction: (() -> Void)?
    
    // MARK: - Label
    lazy var lbSubtitle: UILabel = {
        LabelComponent(.fontLabelTitleRegular, ValuesSignIn_Passwd.subtitile)
    }()
    lazy var lbDescription: UILabel = {
        LabelComponent(.fontLabelSubTitleRegular, ValuesSignIn_Passwd.description,
                       .customColorPageControl)
    }()
    
    // MARK: - TextField
    lazy var txtField: UITextField = {
       let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.backgroundColor = .customColorTextField
        tField.layer.cornerRadius = ConstantsTextField.cornerRadius
        tField.addShadow()
        tField.isSecureTextEntry = true
        tField.placeholder = ValuesSignIn_Passwd.placeholder
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }()
    
    // MARK: - Label observation
    lazy var lbObservation: UILabel = {
        LabelComponent(.fontDescriptionRegular, ValuesSignIn_Passwd.observation,
                       .customColorPageControl, .center)
    }()
    
    // MARK: - Button
    lazy var bttnContinue: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        bttn.setTitleColor(.customColorTextButton, for: .normal)
        bttn.titleLabel?.font = .fontButtonsBlack
        bttn.setTitle(ValuesSignIn_Passwd.buttonTitle, for: .normal)
        bttn.addTarget(self, action: #selector(receiveActionButton), for: .touchUpInside)
        return bttn
    }()
    
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
        alignLbObservation()
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
    
    private func alignLbObservation() {
        self.addSubview(lbObservation)
        NSLayoutConstraint.alignDefaultLabelObservation(lbObservation, txtField.bottomAnchor, self)
    }
    
    private func alignTxtField() {
        self.addSubview(txtField)
        NSLayoutConstraint.alignDefault(txtField, lbDescription.bottomAnchor, self)
        NSLayoutConstraint.activate([
            txtField.heightAnchor.constraint(equalToConstant: ConstantsTextField.height)
        ])
    }
    
    private func alignBttnContinue() {
        self.addSubview(bttnContinue)
        NSLayoutConstraint.alignDefaultButton(bttnContinue, self)
        NSLayoutConstraint.activate([
            
        ])
    }
}

