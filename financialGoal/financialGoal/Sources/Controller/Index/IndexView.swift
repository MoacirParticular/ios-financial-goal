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
        LabelComponent(.fontTextFieldTaxes, IndexConstants.textLbCorrectionIndex)
    }()
    
    private func setlbCorrectionIndex() {
        addSubview(lbCorrectionIndex)
        NSLayoutConstraint.activate([
            lbCorrectionIndex.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbCorrectionTopAnchor),
            lbCorrectionIndex.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbCorrectionIndex.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
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
            textFieldCorrectionIndex.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfCorrectionTopAnchor),
            textFieldCorrectionIndex.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldCorrectionIndex.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor),
            textFieldCorrectionIndex.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfRightAnchorOneAndTwo)
        ])
    }
    
    //MARK: Button "mudar" 1
    var buttonCorrectionIndex: UIButton = {ButtonComponent(title: IndexConstants.titleButton, colorTitle: .customColorRoxo, font: .fontTextFieldTaxes)}()

    func setButtonCorrectionIndex(){
        addSubview(buttonCorrectionIndex)
        buttonCorrectionIndex.addTarget(self, action: #selector(actionBtChange), for: .touchUpInside)
        addSubview(buttonCorrectionIndex)
        NSLayoutConstraint.activate([
            buttonCorrectionIndex.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: IndexConstants.btCorrectionIndex),
            buttonCorrectionIndex.leftAnchor.constraint(equalTo: textFieldCorrectionIndex.rightAnchor, constant: IndexConstants.btLeftAnchor),
            buttonCorrectionIndex.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.btRightAnchor),
            buttonCorrectionIndex.heightAnchor.constraint(equalToConstant: IndexConstants.btHeightAnchor),
        ])
    }
    
    //MARK: Label 2
    let lbPreAndPostFixed: UILabel = {
        LabelComponent(.fontTextFieldTaxes, IndexConstants.titleLbPreAndPosFix)
    }()
      
    private func setlbPreAndPostFixed() {
        addSubview(lbPreAndPostFixed)
        NSLayoutConstraint.activate([
            lbPreAndPostFixed.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbPreAndPosTopAnchor),
            lbPreAndPostFixed.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbPreAndPostFixed.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
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
            textFieldPreAndPostFixed.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfPreAndPostTopAnchor),
            textFieldPreAndPostFixed.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldPreAndPostFixed.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor),
            textFieldPreAndPostFixed.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfPreAndPostRightAnchor)
        ])
    }
    
    //MARK: Button "mudar" 2
    var buttonPreAndPostFixed: UIButton = {ButtonComponent(title: IndexConstants.titleButton, colorTitle: .customColorRoxo, font: .fontTextFieldTaxes)}()
    
     
    func setButtonPreAndPostFixed(){
        addSubview(buttonPreAndPostFixed)
        buttonPreAndPostFixed.addTarget(self, action: #selector(actionButtonChangeTwo), for: .touchUpInside)
        addSubview(buttonPreAndPostFixed)
        NSLayoutConstraint.activate([
            buttonPreAndPostFixed.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: IndexConstants.btPreAndPosTopAnchor),
            buttonPreAndPostFixed.leftAnchor.constraint(equalTo: textFieldCorrectionIndex.rightAnchor, constant: IndexConstants.btLeftAnchor),
            buttonPreAndPostFixed.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor),
            buttonPreAndPostFixed.heightAnchor.constraint(equalToConstant: IndexConstants.btHeightAnchor),
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
            textFieldValueInvest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfValueInvestTopAnchor),
            textFieldValueInvest.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldValueInvest.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfRightAnchor),
            textFieldValueInvest.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor)
        ])
    }
   
    //MARK: Create Label 3
    let lbValueInvest: UILabel = {
        LabelComponent(.fontTextFieldTaxes, IndexConstants.tfTitleValueInvest)
    }()
    
    private func setlbValueInvest() {
        addSubview(lbValueInvest)
        NSLayoutConstraint.activate([
            lbValueInvest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbValueInvestTopAnchor),
            lbValueInvest.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbValueInvest.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
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
            textFieldDueDate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfDueDateTopAnchor),
            textFieldDueDate.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldDueDate.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfRightAnchor),
            textFieldDueDate.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor)
        ])
    }
 
    //MARK: Label 4
    let lbDueDate: UILabel = {
        LabelComponent(.fontTextFieldTaxes, IndexConstants.lbDueDateTitle)
    }()

    private func setlbDueDate() {
        addSubview(lbDueDate)
        NSLayoutConstraint.activate([
            lbDueDate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbDueDataTopAnchor ),
            lbDueDate.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbDueDate.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
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
            textFieldPorcentYearly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfPorcentYearlyTopAnchor),
            textFieldPorcentYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldPorcentYearly.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfRightAnchor),
            textFieldPorcentYearly.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor)
        ])
    }
    
    //MARK: Label 5
    let lbPorcentYearly: UILabel = {
        LabelComponent(.fontTextFieldTaxes, IndexConstants.lbTitlePorcentYearly)
    }()
   
    private func setlbPorcentYearly() {
        addSubview(lbPorcentYearly)
        NSLayoutConstraint.activate([
            lbPorcentYearly.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbPorcentYearlyTopAnchor ),
            lbPorcentYearly.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbPorcentYearly.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
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
            textFieldResult.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.tfResult),
            textFieldResult.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.tfLeftAnchor),
            textFieldResult.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IndexConstants.tfRightAnchor),
            textFieldResult.heightAnchor.constraint(equalToConstant: IndexConstants.tfHeightAnchor)
        ])
    }
    
    //MARK: Label 6
    let lbPreAndResult: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = IndexConstants.lbTitleResult
        label.textAlignment = .left
        label.textColor = .blackCustomGoal
        label.font = .fontTextFieldTaxes
        return label
    }()
    
    private func setlbResult() {
        addSubview(lbPreAndResult)
        NSLayoutConstraint.activate([
            lbPreAndResult.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IndexConstants.lbResultTopAnchor ),
            lbPreAndResult.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.lbLeftAnchor),
            lbPreAndResult.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.lbRightAnchor)
        ])
    }
    
    // MARK: - Button "CALCULAR"
    let bttnCalc: UIButton = {ButtonComponent(title: IndexConstants.titleButtonCalc, background: .blackCustomGoal, colorTitle: .customColorTextButton, font: .fontButtonsBlack, radius: ValuesConstraintsButton.radiusValue)}()
    

    func setButtonCalc(){
        addSubview(bttnCalc)
        bttnCalc.addTarget(self, action: #selector(actionButtonCalc), for: .touchUpInside)
        addSubview(bttnCalc)
        NSLayoutConstraint.activate([
            bttnCalc.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: IndexConstants.btCalcTopAnchor),
            bttnCalc.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: IndexConstants.btLeftAnchor),
            bttnCalc.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: IndexConstants.btRightAnchor),
            bttnCalc.heightAnchor.constraint(equalToConstant: IndexConstants.btHeightAnchor),
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
