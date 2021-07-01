//
//  TaxesView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//


import UIKit

public class TaxesView: UIView {
    
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
        setTextFieldMonthly()
        setTextFieldYearly()
        
    }
    //taxa anual //taxa mensal
   //MARK: Create TextFields
   lazy var textFieldMonthly:UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
    textField.textColor = .customColorResultTaxes
    textField.keyboardType = UIKeyboardType.emailAddress
    textField.keyboardType = UIKeyboardType.numberPad
    textField.font = UIFont.fontTextFieldTaxes
    textField.backgroundColor = .customColorTextField
    textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
    textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)

    textField.addShadow()
    return textField
   }()
    
   lazy var textFieldYearly:UITextField = {
    var textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
    textField.textColor = .white
    textField.keyboardType = UIKeyboardType.numberPad
    textField.font = UIFont.fontTextFieldTaxes
    textField.backgroundColor = .customColorResultTaxes
    textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
    textField.borderStyle = UITextField.BorderStyle.none
    textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
    textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)

    return textField
   }()
    
    //MARK: Constraints TextFields
    func setTextFieldMonthly() {
        addSubview(textFieldMonthly)
        NSLayoutConstraint.activate([
            textFieldMonthly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
            textFieldMonthly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldMonthly.heightAnchor.constraint(equalToConstant: TaxesConstants.heightTFMonthly),
            textFieldMonthly.widthAnchor.constraint(equalToConstant: 215)
       ])
    }

    func setTextFieldYearly() {
        addSubview(textFieldYearly)
        NSLayoutConstraint.activate([
            textFieldYearly.topAnchor.constraint(equalTo: self.textFieldMonthly.bottomAnchor, constant: 14),
            textFieldYearly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldYearly.heightAnchor.constraint(equalToConstant: TaxesConstants.heightTFMonthly),
            textFieldYearly.widthAnchor.constraint(equalToConstant: 215)
       ])
    }
}
