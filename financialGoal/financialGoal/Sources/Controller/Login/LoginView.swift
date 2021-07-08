//
//  LoginView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

import UIKit

public class LoginView: UIView {
    
    //MARK: Properties
    var onLoginButton: ((_ option: LoginActionType) -> Void)?

    //MARK: Starting creations
    override init(frame: CGRect){
        super.init(frame: frame)
        createView()
    }

    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
    
    //MARK: Grouping creations
    func createView() {
        self.backgroundColor = .backgroundCustomGoal
        setTextFieldUser()
        setTextFieldPassword()
        setButtonLogin()
        setButtonForgotPassword()
    }
    
    //MARK: Actions Buttons
    @objc
    func loginActionButton (sender: UIButton!) {
        onLoginButton?(.Login)
    }
    
    @objc
    func forgotPasswordActionButton (sender: UIButton!) {
        onLoginButton?(.Alert)
    }
    
   //MARK: Create TextFields
   lazy var textFieldUser:UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
    textField.placeholder = (StringConstantsLogin.placeHolderUsername)
    textField.keyboardType = UIKeyboardType.emailAddress
    textField.returnKeyType = UIReturnKeyType.default
    textField.font = UIFont.fontTextFieldLogin
    textField.backgroundColor = .customColorTextField
    textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
    textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    textField.addShadow()
    return textField
   }()
    
   lazy var textFieldPassword:UITextField = {
    var textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
    textField.placeholder = (StringConstantsLogin.placeHolderPassword)
    textField.keyboardType = UIKeyboardType.default
    textField.returnKeyType = UIReturnKeyType.done
    textField.font = UIFont.fontTextFieldLogin
    textField.isSecureTextEntry = ConstantsConstraintsLogin.constantIsSecureTextEntry
    textField.backgroundColor = .customColorTextField
    textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
    textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    textField.borderStyle = UITextField.BorderStyle.none
    textField.layer.shadowColor = UIColor.gray.cgColor
    textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.addShadow()
    return textField
   }()
    
    //MARK: Constraints TextFields
    func setTextFieldUser() {
        addSubview(textFieldUser)
        NSLayoutConstraint.activate([
            textFieldUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: ConstantsConstraintsLogin.topAnchorTFusername),
            textFieldUser.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraintsLogin.leftTFUsername),
            textFieldUser.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraintsLogin.rightTFUsername),
            textFieldUser.heightAnchor.constraint(equalToConstant: ConstantsConstraintsLogin.heightTFUsername),
            textFieldUser.widthAnchor.constraint(equalToConstant: ConstantsConstraintsLogin.widthTFUsername)
       ])
    }

    func setTextFieldPassword() {
        addSubview(textFieldPassword)
        NSLayoutConstraint.activate([
            textFieldPassword.topAnchor.constraint(equalTo: self.textFieldUser.bottomAnchor, constant: ConstantsConstraintsPassword.topAnchorPassword),
            textFieldPassword.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(ConstantsConstraintsPassword.leftTFPassword)),
            textFieldPassword.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(ConstantsConstraintsPassword.rightTFPassword)),
            textFieldPassword.heightAnchor.constraint(equalToConstant: ConstantsConstraintsPassword.heightTFPassword)
       ])
    }

    //MARK: Create Buttons
    let buttonLogin: UIButton = {ButtonComponent(title: StringConstantsLogin.titleButtonLogin, background: .blackCustomGoal, colorTitle: .customColorTextButton, font: .fontButtonsBlack, radius: ConstantsConstraintsBtLogin.cornerRadiusButton
)}()

    let buttonForgotPassword: UIButton = {ButtonComponent(title: StringConstantsLogin.titleButtonPassword, colorTitle: .blackCustomGoal, font: .fontForgetPasswordSubTitleRegular)}()

    //MARK: Constraints Buttons
    func setButtonLogin(){
       buttonLogin.addTarget(self, action: #selector(loginActionButton), for: .touchUpInside)
       addSubview(buttonLogin)
       NSLayoutConstraint.activate([
        buttonLogin.topAnchor.constraint(equalTo: self.textFieldPassword.bottomAnchor, constant: ConstantsConstraintsBtLogin.topAnchorbtLogin),
        buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraintsBtLogin.leftAnchorBtLogin),
        buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraintsBtLogin.rightAnchorBtLogin),
        buttonLogin.heightAnchor.constraint(equalToConstant: ConstantsConstraintsBtLogin.heightAnchorbtLogin)
       ])
    }
    
    func setButtonForgotPassword(){
        buttonForgotPassword.addTarget(self, action: #selector(forgotPasswordActionButton), for: .touchUpInside)
        addSubview(buttonForgotPassword)
        NSLayoutConstraint.activate([
            buttonForgotPassword.topAnchor.constraint(equalTo: self.buttonLogin.bottomAnchor, constant: ConstantsConstraintsBtForgetPass.topAnchorBtForgotPass),
            buttonForgotPassword.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraintsBtForgetPass.leftAnchorBtForgotPass),
            buttonForgotPassword.heightAnchor.constraint(equalToConstant: ConstantsConstraintsBtForgetPass.heightAnchorBtForgotPass)
       ])
    }
}
