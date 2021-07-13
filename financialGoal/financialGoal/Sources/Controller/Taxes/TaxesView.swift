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
        alignLbYearly()
        alignLbMonthly()
        setTextFieldYearly()
        setTextFieldMonthly()
    }

   //MARK: Create TextFields
    lazy var textFieldYearly:UITextField = {
        let tf:UITextField = TextFieldComponent()
        tf.isUserInteractionEnabled = true
        tf.addShadow()
        return tf
    }()
    
   lazy var textFieldMonthly:UITextField = {
    let tf = TextFieldComponent()
    tf.textColor = .customColorResultLabel
    tf.backgroundColor = .customColorResultTaxes
    tf.borderStyle = UITextField.BorderStyle.none
    return tf
   }()
    
    //MARK: Constraints TextFields
    func setTextFieldYearly() {
        addSubview(textFieldYearly)
        NSLayoutConstraint.activate([
            textFieldYearly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: TaxesConstants.topAnchorYearlyTF),
            textFieldYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.leftAnchorTF),
            textFieldYearly.heightAnchor.constraint(equalToConstant: TaxesConstants.heightTFMonthly),
            textFieldYearly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: TaxesConstants.rightAnchorTF)
       ])
    }
    
    func setTextFieldMonthly() {
        addSubview(textFieldMonthly)
        NSLayoutConstraint.activate([
            textFieldMonthly.topAnchor.constraint(equalTo: self.textFieldYearly.bottomAnchor, constant: TaxesConstants.topAnchorMonthlyTF),
            textFieldMonthly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.leftAnchorTF),
            textFieldMonthly.heightAnchor.constraint(equalToConstant: TaxesConstants.heightTFMonthly),
            textFieldMonthly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: TaxesConstants.rightAnchorTF)
       ])
    }
    
    
    // MARK: - Labels
    let lbYearly: UILabel = {
        LabelComponent(.fontTextFieldTaxes, TaxesConstants.lbYearlyText, .blackCustomGoal, TaxesConstants.lbAlignment)
    }()
    
    let lbMonthly: UILabel = {
        LabelComponent(.fontTextFieldTaxes, TaxesConstants.lbMonthlyText, .blackCustomGoal, TaxesConstants.lbAlignment)
    }()
    
    // MARK: - Constraints Labels
    private func alignLbYearly() {
        self.addSubview(lbYearly)
        NSLayoutConstraint.activate([
            lbYearly.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: TaxesConstants.topAnchorYearly),
            lbYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.LbLeftAnchor),
            lbYearly.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.LbRightAnchor)
        ])
    }
    
    private func alignLbMonthly() {
        self.addSubview(lbMonthly)
        NSLayoutConstraint.activate([
            lbMonthly.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.lbYearly.bottomAnchor, constant: TaxesConstants.topAnchorMonthly),
            lbMonthly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.LbLeftAnchor),
            lbMonthly.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: TaxesConstants.LbRightAnchor)
        ])
    }
}
