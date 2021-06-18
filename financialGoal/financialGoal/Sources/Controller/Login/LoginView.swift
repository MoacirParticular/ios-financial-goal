//
//  LoginView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

import UIKit

class LoginView: UIView {
    
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
        setTextFieldUsuario()
        setTextFieldSenha()
        setButtonLogin()
        setButtonForgotPassword()
    }
    
    //MARK: Actions Buttons
    @objc
    func loginActionButton (sender: UIButton!) {
    }
    
    @objc
    func forgotPasswordActionButton (sender: UIButton!) {
        onLoginButton?(.Alert)
    }
    
   //MARK: Create TextFields
   lazy var textFieldUsuario:UITextField = {
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
    
   lazy var textFieldSenha:UITextField = {
    var textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
    textField.placeholder = (StringConstantsLogin.placeHolderPassword)
    textField.keyboardType = UIKeyboardType.default
    textField.returnKeyType = UIReturnKeyType.done
    textField.font = UIFont.fontTextFieldLogin
    textField.isSecureTextEntry = true
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
    func setTextFieldUsuario() {
        addSubview(textFieldUsuario)
        NSLayoutConstraint.activate([
            textFieldUsuario.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: ConstantsConstraintsLogin.topAnchorTFusername),
            textFieldUsuario.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraintsLogin.leftTFUsername),
            textFieldUsuario.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraintsLogin.rightTFUsername),
            textFieldUsuario.heightAnchor.constraint(equalToConstant: ConstantsConstraintsLogin.heightTFUsername),
            textFieldUsuario.widthAnchor.constraint(equalToConstant: ConstantsConstraintsLogin.widthTFUsername)
       ])
    }

    func setTextFieldSenha() {
        addSubview(textFieldSenha)
        NSLayoutConstraint.activate([
            textFieldSenha.topAnchor.constraint(equalTo: self.textFieldUsuario.bottomAnchor, constant: ConstantsConstraintsPassword.topAnchorPassword),
            textFieldSenha.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(ConstantsConstraintsPassword.leftTFPassword)),
            textFieldSenha.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(ConstantsConstraintsPassword.rightTFPassword)),
            textFieldSenha.heightAnchor.constraint(equalToConstant: ConstantsConstraintsPassword.heightTFPassword)
       ])
    }

    //MARK: Create Buttons
    let buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        button.frame = ConstantsConstraintsBtLogin.frameBtLogin
        button.layer.cornerRadius = ConstantsConstraintsBtLogin.cornerRadiusButton
        button.backgroundColor = .blackCustomGoal
        button.setTitle(StringConstantsLogin.titleButtonLogin, for: .normal)
        button.titleLabel?.font = .fontButtonsBlack
        return button
    }()

    let buttonForgotPassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        button.frame = ConstantsConstraintsBtForgetPass.frameBtForgotPass
        button.setTitleColor(.blackCustomGoal, for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitle(StringConstantsLogin.titleButtonPassword, for: .normal)
        button.titleLabel?.font = .fontForgetPasswordSubTitleRegular
        return button
    }()

    //MARK: Constraints Buttons
    func setButtonLogin(){
       buttonLogin.addTarget(self, action: #selector(loginActionButton), for: .touchUpInside)
       addSubview(buttonLogin)
       NSLayoutConstraint.activate([
        buttonLogin.topAnchor.constraint(equalTo: self.textFieldSenha.bottomAnchor, constant: ConstantsConstraintsBtLogin.topAnchorbtLogin),
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
            buttonForgotPassword.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraintsBtForgetPass.rightAnchorBtForgotPass),
            buttonForgotPassword.heightAnchor.constraint(equalToConstant: ConstantsConstraintsBtForgetPass.heightAnchorBtForgotPass)
       ])
    }
}
