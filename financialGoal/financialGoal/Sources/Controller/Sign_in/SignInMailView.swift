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
    let lbSubtitle: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = ValuesSignIn_Mail.subtitile
        label.numberOfLines = StaticConfigLabel.subtitleNumberOfLines
        label.font = .fontLabelTitleRegular
        return label
    }()
    let lbDescription: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.textColor = .customColorPageControl
        label.text = ValuesSignIn_Mail.description
        label.font = .fontLabelSubTitleRegular
        return label
    }()
    
    // MARK: - TextField
    let txtField: UITextField = {
       let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.borderStyle = .roundedRect
        tField.addShadow()
        tField.placeholder = ValuesSignIn_Mail.placeholder
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }()
    
    // MARK: - Button
    let bttnContinue: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        bttn.setTitleColor(.white, for: .normal)
        bttn.titleLabel?.font = .fontButtonsBlack
        bttn.setTitle(ValuesSignIn_Mail.buttonTitle, for: .normal)
        bttn.addTarget(self, action: #selector(receiveActionButton), for: .touchUpInside)
        return bttn
    }()
    
    // MARK: - Methods/ Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            txtField.heightAnchor.constraint(equalToConstant: ValuesConstraintsTextField.height)
        ])
    }
    
    private func alignBttnContinue() {
        self.addSubview(bttnContinue)
        NSLayoutConstraint.alignDefaultButton(bttnContinue, self)
        NSLayoutConstraint.activate([
            
        ])
    }
}
