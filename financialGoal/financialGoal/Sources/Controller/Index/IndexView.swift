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
        setTextFieldDueDate()
        setTextFieldValueInvest()
        setTextFieldPorcentYearly()
        setTextFieldResult()
        setButtonCalc()
        setlbPorcentYearly()
        setlbResult()
        setlbDueDate()
        setlbValueInvest()
        
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
    
    //MARK: Create TextField 3
    lazy var textFieldValueInvest:UITextField = {
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
    
    func setTextFieldValueInvest() {
        addSubview(textFieldValueInvest)
        NSLayoutConstraint.activate([
            textFieldValueInvest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 280),
            textFieldValueInvest.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldValueInvest.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldValueInvest.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
  
    //MARK: Label 3
    let lbPreAndValueInvest: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Valor que você vai investir"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbValueInvest() {
        addSubview(lbPreAndValueInvest)
        NSLayoutConstraint.activate([
            lbPreAndValueInvest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 248 ),
            lbPreAndValueInvest.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbPreAndValueInvest.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    //MARK: Create TextField 4
    lazy var textFieldDueDate:UITextField = {
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
    
    func setTextFieldDueDate() {
        addSubview(textFieldDueDate)
        NSLayoutConstraint.activate([
            textFieldDueDate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 388),
            textFieldDueDate.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldDueDate.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldDueDate.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: Label 4
    let lbPreAndDueDate: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Prazo ou vencimento"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbDueDate() {
        addSubview(lbPreAndDueDate)
        NSLayoutConstraint.activate([
            lbPreAndDueDate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 356 ),
            lbPreAndDueDate.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbPreAndDueDate.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    //MARK: Create TextField 5
    lazy var textFieldPorcentYearly:UITextField = {
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
    
    func setTextFieldPorcentYearly() {
        addSubview(textFieldPorcentYearly)
        NSLayoutConstraint.activate([
            textFieldPorcentYearly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 496),
            textFieldPorcentYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldPorcentYearly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldPorcentYearly.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: Label 5
    let lbPreAndPorcentYearly: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Porcentagem ao ano"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
   
    private func setlbPorcentYearly() {
        addSubview(lbPreAndPorcentYearly)
        NSLayoutConstraint.activate([
            lbPreAndPorcentYearly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 464 ),
            lbPreAndPorcentYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbPreAndPorcentYearly.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    //MARK: Create TextField 6
    lazy var textFieldResult:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = ConstantsConstraintsLogin.maskIntoConstraints
        textField.textColor = .blackCustomGoal
        textField.keyboardType = UIKeyboardType.numberPad
        textField.font = UIFont.fontTextFieldTaxes
        textField.isUserInteractionEnabled = false
        textField.backgroundColor = .customColorResultTaxes
        textField.layer.cornerRadius = ConstantsConstraintsLogin.cornerRadiusTF
        textField.setLeftPaddingPoints(ValuesConstraintsTextField.textIdent)
        textField.setRightPaddingPoints(ValuesConstraintsTextField.textIdent)
        return textField
    }()
    
    func setTextFieldResult() {
        addSubview(textFieldResult)
        NSLayoutConstraint.activate([
            textFieldResult.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 604),
            textFieldResult.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            textFieldResult.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            textFieldResult.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: Label 6
    let lbPreAndResult: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Valor obtido no final"
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbResult() {
        addSubview(lbPreAndResult)
        NSLayoutConstraint.activate([
            lbPreAndResult.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 572 ),
            lbPreAndResult.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            lbPreAndResult.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
    
    // MARK: - Button
    let bttnCalc: UIButton = {
        let button = UIButton()
        UIView.configInitailElements(button)
        button.backgroundColor = .blackCustomGoal
        button.setTitle("CALCULAR", for: .normal)
        button.layer.cornerRadius = ValuesConstraintsButton.radiusValue
        button.titleLabel?.font = .fontButtonsBlack
        return button
    }()
    
    func setButtonCalc(){
        addSubview(bttnCalc)
        bttnCalc.addTarget(self, action: #selector(actionButtonCalc), for: .touchUpInside)
        addSubview(bttnCalc)
        NSLayoutConstraint.activate([
            bttnCalc.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 696),
            bttnCalc.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            bttnCalc.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            bttnCalc.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    //MARK: Actions Buttons
    
    @objc
    func actionButtonCalc (sender: UIButton!) {
        onButtonCorrectionIndex?(.Result)
    }
    
    @objc
    func actionBtChange (sender: UIButton!) {
        onButtonCorrectionIndex?(.IndexCorrection)
    }
    
    @objc
    func actionButtonChangeTwo (sender: UIButton!) {
        onButtonCorrectionIndex?(.PeriodFix)
    }
    
}


