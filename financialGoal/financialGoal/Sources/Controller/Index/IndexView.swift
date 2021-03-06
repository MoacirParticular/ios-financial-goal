//
//  IndexView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 05/07/21.
//


import UIKit

public class IndexView: UIView {
    
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
        setTextFieldOne()
        setButtonChange()
    }
    
    //MARK: Create TextField
    lazy var textFieldOne:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        textField.textColor = .customColorResultTaxes
        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont.fontTextFieldTaxes
        textField.backgroundColor = .customColorTextField
        textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
        textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.addShadow()
        return textField
    }()
    
    //MARK: Constraints TextField
    func setTextFieldOne() {
        addSubview(textFieldOne)
        NSLayoutConstraint.activate([
            textFieldOne.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            textFieldOne.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldOne.heightAnchor.constraint(equalToConstant: 60),
            textFieldOne.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -123)
        ])
    }
    
    var buttonChange: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        button.setTitle("mudar", for: .normal)
        button.setTitleColor(.customColorRoxo, for: .normal)
        return button
    }()
    
    func setButtonChange(){
        addSubview(buttonChange)
        buttonChange.addTarget(self, action: #selector(actionBtChange), for: .touchUpInside)
        addSubview(buttonChange)
        NSLayoutConstraint.activate([
            buttonChange.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            buttonChange.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 255 ),
            buttonChange.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])
    }
    
    //MARK: Actions Buttons
    @objc
    func actionBtChange (sender: UIButton!) {
       print("Primeiro Botao")
    }
    
}


