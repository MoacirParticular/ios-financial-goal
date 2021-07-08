//
//  SignInNameView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 17/06/21.
//

import UIKit

class SignInNameView: UIView {
    var buttonAction: (() -> Void)?
    
    // MARK: - Label
    lazy var lbSubtitle: UILabel = {
        LabelComponent(.fontLabelTitleRegular, ValuesSignIn_Name.subtitile)
    }()
    lazy var lbDescription: UILabel = {
        LabelComponent(.fontLabelSubTitleRegular, ValuesSignIn_Name.description,
                       .customColorPageControl)
    }()
    
    // MARK: - TextField
    lazy var txtField: UITextField = {
       let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.backgroundColor = .customColorTextField
        tField.layer.cornerRadius = ConstantsTextField.cornerRadius
        tField.addShadow()
        tField.placeholder = ValuesSignIn_Name.placeholder
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }()
    
    // MARK: - Button
    lazy var bttnContinue: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        bttn.setTitleColor(.customColorTextButton, for: .normal)
        bttn.titleLabel?.font = .fontButtonsBlack
        bttn.setTitle(ValuesSignIn_Name.buttonTitle, for: .normal)
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
        self.addSubview(bttnContinue)
        NSLayoutConstraint.alignDefaultButton(bttnContinue, self)
        NSLayoutConstraint.activate([
            
        ])
    }
}
