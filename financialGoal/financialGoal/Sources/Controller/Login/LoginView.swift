//
//  LoginView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

import UIKit

class LoginView: UIView {
    
    var onLoginButton: ((_ option: Int) -> Void)?

//MARK: TextFields

   lazy var textFieldUsuario:UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = (ConstantLogin.placeHolderUsername)
    textField.keyboardType = UIKeyboardType.emailAddress
    textField.returnKeyType = UIReturnKeyType.default
    textField.font = UIFont.systemFont(ofSize: 17)
    textField.backgroundColor = .white
//    textField.layer.cornerRadius =
    textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
    
//    textField.leftView = UITextField(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
//    textField.leftViewMode = .always
    
    textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    textField.addShadow()
    
    return textField
   }()
    
    
   lazy var textFieldSenha:UITextField = {
    var textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = (ConstantLogin.placeHolderPassword)
    textField.keyboardType = UIKeyboardType.default
    textField.returnKeyType = UIReturnKeyType.done
    textField.font = UIFont.systemFont(ofSize: 17)
    textField.isSecureTextEntry = true
    textField.backgroundColor = UIColor.white
    textField.layer.cornerRadius = cornerRadiusTF
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
        textFieldUsuario.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 52),
        textFieldUsuario.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(constraintLeftTFUsername)),
        textFieldUsuario.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(constraintRightTFUsername)),
        textFieldUsuario.heightAnchor.constraint(equalToConstant: CGFloat(constraintHeightTFUsername)),
        textFieldUsuario.widthAnchor.constraint(equalToConstant: CGFloat(constraintWidthTFUsername))
        
       ])
    }
    
    func setTextFieldSenha() {
        addSubview(textFieldSenha)
        NSLayoutConstraint.activate([
        textFieldSenha.topAnchor.constraint(equalTo: self.textFieldUsuario.bottomAnchor, constant: 1),
        textFieldSenha.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(constraintLeftTFPassword)),
        textFieldSenha.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(constraintRightTFPassword)),
        textFieldSenha.heightAnchor.constraint(equalToConstant: CGFloat(constraintHeightTFPassword))
       ])
    }

    //MARK: Buttons
    
    let buttonLogin: UIButton = {
        let button = UIButton()
    
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = .zero
        button.layer.cornerRadius = cornerRadiusButton
        button.backgroundColor = .blackCustomGoal   //ALTERAR COR
        button.setTitle(ConstantLogin.titleButtonLogin, for: .normal)
       
        return button
    }()

    let buttonForgotPassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = .zero
        button.setTitleColor(.blackCustomGoal, for: .normal)          //ALTERAR COR
        button.contentHorizontalAlignment = .left
        button.setTitle(ConstantLogin.titleButtonPassword, for: .normal)
        return button
    }()

    //MARK: Constraints Buttons
    func setButtonLogin(){
       buttonLogin.addTarget(self, action: #selector(loginActionButton), for: .touchUpInside)
       
       addSubview(buttonLogin)
       NSLayoutConstraint.activate([
        buttonLogin.topAnchor.constraint(equalTo: self.textFieldSenha.bottomAnchor, constant: constraintTopAnchorbtLogin),
        buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constraintLeftAnchorBtLogin),
        buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: constraintRightAnchorBtLogin),
        buttonLogin.heightAnchor.constraint(equalToConstant: constraintHeightAnchorbtLogin)
       ])
    }
    func setButtonForgotPassword(){
        buttonForgotPassword.addTarget(self, action: #selector(forgotPasswordActionButton), for: .touchUpInside)
        addSubview(buttonForgotPassword)
        NSLayoutConstraint.activate([
        buttonForgotPassword.topAnchor.constraint(equalTo: self.buttonLogin.bottomAnchor, constant: constraintTopAnchorBtForgotPass),
        buttonForgotPassword.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constraintLeftAnchorBtForgotPass),
        buttonForgotPassword.rightAnchor.constraint(equalTo: self.rightAnchor, constant: constraintRightAnchorBtForgotPass),
        buttonForgotPassword.heightAnchor.constraint(equalToConstant: constraintHeightAnchorBtForgotPass)
       ])
    }

    //MARK: Actions Buttons

    @objc
    func loginActionButton (sender: UIButton!) {
        print("Tentando logar")
    }
    
    

    
    @objc
    func forgotPasswordActionButton (sender: UIButton!) {
        onLoginButton?(1)
    
        print("Usuário esqueceu a senha")
        //print(textFieldUsuario.text!)
    }



    override init(frame: CGRect){
        super.init(frame: frame)
        createView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createView() {
        self.backgroundColor = .backgroundCustomGoal           //ALTERAR COR
        setTextFieldUsuario()
        setTextFieldSenha()
        setButtonLogin()
        setButtonForgotPassword()

    }
    
}

// Shadow TextField

//extension UITextField {
//
//    func addShadow() {
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: -6, height: 0)
//        self.layer.shadowOpacity = 0.08
//    }
//}

