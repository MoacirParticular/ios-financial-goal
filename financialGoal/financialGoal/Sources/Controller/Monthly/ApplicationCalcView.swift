//
//  ApplicationCalcView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

protocol ViewCalcProtocol {
    var viewCalc: ApplicationCalcView { get }
}
extension ViewCalcProtocol {
    func setupView(infoScreen: CalcScreenData, viewBase: UIView) {
        viewCalc.configElements(infoScreen: infoScreen)
        viewCalc.setUp(viewBase: viewBase)
    }
}
class ApplicationCalcView: UIView {
    var buttonAction: (() -> Void)?
    
    // MARK: - Label
    lazy var lbFirst: UILabel = { createLabel() }()
    lazy var lbSecond: UILabel = { createLabel() }()
    lazy var lbThird: UILabel = { createLabel() }()
    lazy var lbFourth: UILabel = { createLabel() }()
    lazy var lbFifth: UILabel = { createLabel() }()
    
    // MARK: - TextField
    lazy var tfFirst: UITextField = { createTextField() }()
    lazy var tfSecond: UITextField = { createTextField() }()
    lazy var tfThird: UITextField = { createTextField() }()
    lazy var tfFourth: UITextField = { createTextField() }()
    lazy var tfFifth: UITextField = { createTextField() }()
    
    // MARK: - Button
    let bttnCalcular: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        bttn.setTitleColor(.white, for: .normal)
        bttn.titleLabel?.font = .fontButtonsBlack
        return bttn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundCustomGoal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration elements
    func configElements(infoScreen: CalcScreenData) {
        lbFirst.text = infoScreen.firstLabel
        alignLabel(label: lbFirst, top: self, first: true)
        alignTextField(textField: tfFirst, top: lbFirst)
        
        lbSecond.text = infoScreen.secondLabel
        alignLabel(label: lbSecond, top: tfFirst)
        alignTextField(textField: tfSecond, top: lbSecond)
        
        lbThird.text = infoScreen.thirdLabel
        alignLabel(label: lbThird, top: tfSecond)
        alignTextField(textField: tfThird, top: lbThird)
        
        var viewBase: UIView = tfThird
        switch (infoScreen.screen) {
        case .Monthly:
            alignCaseMonthyScreen(infoScreen: infoScreen)
            viewBase = tfFourth
            break
        case .Yearly:
            break
        }
        
        lbFifth.text = infoScreen.fifthLabel
        alignLabel(label: lbFifth, top: viewBase)
        tfFifth.isUserInteractionEnabled = false
        tfFifth.backgroundColor = .customColorPageControl
        alignTextField(textField: tfFifth, top: lbFifth)
        
        alignButton(button: bttnCalcular, top: tfFifth)
        bttnCalcular.addTarget(self, action: #selector(setAction), for: .touchUpInside)
        bttnCalcular.setTitle(infoScreen.buttonTitle, for: .normal)
    }
    
    // MARK: - Monthly configuration
    private func alignCaseMonthyScreen(infoScreen: CalcScreenData) {
        lbFourth.text = infoScreen.fourthLabel
        alignLabel(label: lbFourth, top: tfThird)
        alignTextField(textField: tfFourth, top: lbFourth)
    }
    
    // MARK: - Element Factory
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = .fontLabelCalc
        UIView.configInitailElements(label)
        return label
    }
    
    private func createTextField() -> UITextField {
        let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.backgroundColor = .customColorTextField
        tField.layer.cornerRadius = ConstantsTextField.cornerRadius
        tField.addShadow()
        tField.textColor = .customColorResultTaxes
        tField.keyboardType = UIKeyboardType.decimalPad
        tField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        tField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return tField
    }
    
    @objc private func setAction() {
        buttonAction?()
    }
}

extension ApplicationCalcView {
    
    // MARK: - Constraints
    func setUp(viewBase: UIView) {
        viewBase.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: viewBase.topAnchor),
            self.centerXAnchor.constraint(equalTo: viewBase.centerXAnchor),
            self.widthAnchor.constraint(equalTo: viewBase.widthAnchor),
            self.bottomAnchor.constraint(equalTo: self.bttnCalcular.bottomAnchor, constant: MonthlyConstraints.identBottom),
            self.bottomAnchor.constraint(equalTo: viewBase.bottomAnchor),
        ])
    }
    
    private func alignLabel(label: UILabel, top: UIView, first: Bool = false) {
        self.addSubview(label)
        if first {
            NSLayoutConstraint.activate([
                    label.topAnchor.constraint(
                        equalTo: top.topAnchor, constant: MonthlyLabelConstraints.firstIdentTop)
            ])
        } else {
            NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: top.bottomAnchor, constant: MonthlyLabelConstraints.identTop)])
        }
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: MonthlyConstraints.identLeft),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: MonthlyConstraints.identRight)
        ])
    }
    
    private func alignTextField(textField: UITextField, top: UIView) {
        self.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: top.bottomAnchor, constant: MonthlyTextFieldsConstraints.identTop),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: MonthlyConstraints.identLeft),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: MonthlyConstraints.identRight),
            textField.heightAnchor.constraint(equalToConstant: MonthlyTextFieldsConstraints.height)
        ])
    }
    
    private func alignButton(button: UIButton, top: UIView) {
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: top.bottomAnchor, constant: MonthlyButtonConstraints.identTop),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: MonthlyConstraints.identLeft),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: MonthlyConstraints.identRight),
            button.heightAnchor.constraint(equalToConstant: MonthlyButtonConstraints.height)
        ])
    }
}
