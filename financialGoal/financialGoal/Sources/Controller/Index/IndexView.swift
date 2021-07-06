//
//  IndexView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 05/07/21.
//


import UIKit

public class IndexView: UIView {
    var onButtonCorrectionIndex: ((_ type: EnumIndex) -> Void)?
    
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
        setTextFieldCorrectionIndex()
        setButtonCorrectionIndex()
        setlbCorrectionIndex()
        
        setTextFieldPreAndPostFixed()
        setButtonPreAndPostFixed()
        setlbPreAndPostFixed()
    }
    //MARK: Label 1
    let lbCorrectionIndex: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Indices para correção"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbCorrectionIndex() {
        addSubview(lbCorrectionIndex)
        NSLayoutConstraint.activate([
            lbCorrectionIndex.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32 ),
            lbCorrectionIndex.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbCorrectionIndex.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    //MARK: Create TextField 1
    lazy var textFieldCorrectionIndex:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        textField.textColor = .customColorResultTaxes
        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont.fontTextFieldTaxes
        textField.isUserInteractionEnabled = false
        textField.backgroundColor = .customColorTextField
        textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
        textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.addShadow()
        return textField
    }()
        
    func setTextFieldCorrectionIndex() {
        addSubview(textFieldCorrectionIndex)
        NSLayoutConstraint.activate([
            textFieldCorrectionIndex.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            textFieldCorrectionIndex.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldCorrectionIndex.heightAnchor.constraint(equalToConstant: 60),
            textFieldCorrectionIndex.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -123)
        ])
    }
    //MARK: Botão mudar 1
    var buttonCorrectionIndex: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        button.setTitle("mudar", for: .normal)
        button.titleLabel?.font = .fontTextFieldTaxes
        button.setTitleColor(.customColorRoxo, for: .normal)
        return button
    }()
    
    func setButtonCorrectionIndex(){
        addSubview(buttonCorrectionIndex)
        buttonCorrectionIndex.addTarget(self, action: #selector(actionBtChange), for: .touchUpInside)
        addSubview(buttonCorrectionIndex)
        NSLayoutConstraint.activate([
            buttonCorrectionIndex.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            buttonCorrectionIndex.leftAnchor.constraint(equalTo: textFieldCorrectionIndex.rightAnchor, constant: 8),
            buttonCorrectionIndex.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            buttonCorrectionIndex.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
    //MARK: Label 2
    let lbPreAndPostFixed: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "É pré fixado ou pós fixado?"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbPreAndPostFixed() {
        addSubview(lbPreAndPostFixed)
        NSLayoutConstraint.activate([
            lbPreAndPostFixed.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 140 ),
            lbPreAndPostFixed.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbPreAndPostFixed.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    //MARK: Create TextField 2
    lazy var textFieldPreAndPostFixed:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        textField.textColor = .customColorResultTaxes
        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont.fontTextFieldTaxes
        textField.isUserInteractionEnabled = false
        textField.backgroundColor = .customColorTextField
        textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
        textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.addShadow()
        return textField
    }()
        
    func setTextFieldPreAndPostFixed() {
        addSubview(textFieldPreAndPostFixed)
        NSLayoutConstraint.activate([
            textFieldPreAndPostFixed.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 172),
            textFieldPreAndPostFixed.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldPreAndPostFixed.heightAnchor.constraint(equalToConstant: 60),
            textFieldPreAndPostFixed.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -123)
        ])
    }
    
    //MARK: Botão mudar 2
    var buttonPreAndPostFixed: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        button.setTitle("mudar", for: .normal)
        button.titleLabel?.font = .fontTextFieldTaxes
        button.setTitleColor(.customColorRoxo, for: .normal)
        return button
    }()
    
    func setButtonPreAndPostFixed(){
        addSubview(buttonPreAndPostFixed)
        buttonPreAndPostFixed.addTarget(self, action: #selector(actionButtonChangeTwo), for: .touchUpInside)
        addSubview(buttonPreAndPostFixed)
        NSLayoutConstraint.activate([
            buttonPreAndPostFixed.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 172),
            buttonPreAndPostFixed.leftAnchor.constraint(equalTo: textFieldCorrectionIndex.rightAnchor, constant: 8),
            buttonPreAndPostFixed.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            buttonPreAndPostFixed.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    //MARK: Actions Buttons
    @objc
    func actionBtChange (sender: UIButton!) {
        onButtonCorrectionIndex?(.IndexCorrection)
        
    }
    
    @objc
    func actionButtonChangeTwo (sender: UIButton!) {
        onButtonCorrectionIndex?(.PeriodFix)
        
    }
    
}


