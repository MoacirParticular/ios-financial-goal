//
//  LoginView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 14/06/21.
//

import UIKit

class LoginView: UIView {
    
    lazy var textView: UIView = {
        
        let teste = UIView()
        teste.frame(forAlignmentRect: CGRect.zero)
        teste.layer.cornerRadius = 10.0
        teste.clipsToBounds = true
//        teste.backgroundColor = .white
        teste.addShadow()
        
        teste.translatesAutoresizingMaskIntoConstraints = false
        
        return teste
    }()
    
    //MARK: TextFields

    lazy var textFieldUsuario:UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "usuario"
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.returnKeyType = UIReturnKeyType.default
        textField.clipsToBounds = true
        textField.backgroundColor = .white
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
    
      
        
        return textField
    }()
    

    lazy var textFieldSenha:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "senha"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.addShadow()
        
        return textField
    }()
    
   
    
    func textViewConstraints() {
        self.addSubview(textView)
        
       NSLayoutConstraint.activate([
        textView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 52),
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(constraintLeftTFUsername)),
        textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(constraintRightTFUsername)),
        textView.heightAnchor.constraint(equalToConstant: CGFloat(constraintHeightTFUsername * 2)),
        textView.widthAnchor.constraint(equalToConstant: CGFloat(constraintWidthTFUsername))
        
       ])
    }

    //MARK: Constraints TextFields
    
    func setTextFieldUsuario() {

        self.textView.addSubview(textFieldUsuario)
       NSLayoutConstraint.activate([
        textFieldUsuario.topAnchor.constraint(equalTo: textView.topAnchor, constant: 0),
        textFieldUsuario.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(constraintLeftTFUsername)),
        textFieldUsuario.rightAnchor.constraint(equalTo: self.rightAnchor, constant: CGFloat(constraintRightTFUsername)),
        textFieldUsuario.heightAnchor.constraint(equalToConstant: CGFloat(constraintHeightTFUsername)),
        textFieldUsuario.widthAnchor.constraint(equalToConstant: CGFloat(constraintWidthTFUsername))
        
       ])
    }
    func setTextFieldSenha() {
        
        self.textView.addSubview(textFieldSenha)
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
        button.layer.cornerRadius = 6
        button.backgroundColor = .black   //ALTERAR COR
        button.setTitle("LOGIN", for: .normal)
        return button
    }()


    let buttonForgotPassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = .zero
        button.setTitleColor(.black, for: .normal)          //ALTERAR COR
        button.contentHorizontalAlignment = .left
        button.setTitle("esqueci minha senha", for: .normal)
        return button
    }()

    //MARK: Constraints Buttons
    func setButtonLogin(){
       buttonLogin.addTarget(self, action: #selector(loginActionButton), for: .touchUpInside)
       
       addSubview(buttonLogin)
       NSLayoutConstraint.activate([
        buttonLogin.topAnchor.constraint(equalTo: self.textFieldSenha.bottomAnchor, constant: 20),
        buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        buttonLogin.heightAnchor.constraint(equalToConstant: 52)
       ])
    }
    func setButtonForgotPassword(){
        buttonForgotPassword.addTarget(self, action: #selector(forgotPasswordActionButton), for: .touchUpInside)
       
       addSubview(buttonForgotPassword)
       NSLayoutConstraint.activate([
        buttonForgotPassword.topAnchor.constraint(equalTo: self.buttonLogin.bottomAnchor, constant: 15),
        buttonForgotPassword.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
        buttonForgotPassword.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        buttonForgotPassword.heightAnchor.constraint(equalToConstant: 52)
       ])
    }

    //MARK: Actions Buttons

    @objc
    func loginActionButton (sender: UIButton!) {
        print("Tentando logar")
    }

    @objc
    func forgotPasswordActionButton (sender: UIButton!) {
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
        textViewConstraints()
        setTextFieldUsuario()
        setTextFieldSenha()
        setButtonLogin()
        setButtonForgotPassword()

    }

}

// Shadow TextField

extension UIView {

    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: -6, height: 4)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.1
    }
}

