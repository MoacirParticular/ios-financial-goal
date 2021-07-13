//
//  IndexViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 05/07/21.
//


import UIKit

class IndexViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Proprieties:
    var indexView = IndexView(frame: FrameConstants.frameZero)
    let scrollView: UIScrollView = UIScrollView(frame: .zero)
    var dataSelected = [String]()
    var typeData: EnumIndex?
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        listennerKeyBoardCalcs()
        navigationTitleConfig(title: IndexData.titlenavigation)
        listenIndex()
        setInitial()
        textfieldsDelegate()
    }
    
    override func loadView() {
        self.scrollView.addSubview(indexView)
    }
    
    func textfieldsDelegate(){
        self.indexView.textFieldPorcentYearly.delegate = self
        self.indexView.textFieldDueDate.delegate = self
        self.indexView.textFieldValueInvest.delegate = self
    }
    
    //MARK: Set ScrollView
    func setScrollView(){
        self.view = scrollView
        self.scrollView.backgroundColor = .backgroundCustomGoal
        indexView.translatesAutoresizingMaskIntoConstraints = false
        indexView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        indexView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        indexView.bottomAnchor.constraint(equalTo: self.indexView.bttnCalc.bottomAnchor, constant: IndexConstants.bottomScrolView).isActive = true
        indexView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
    }
    
    //MARK: Verifica o tipo do botão clicado
    func listenIndex() {
        indexView.onButtonCorrectionIndex = { type in
            self.typeData = type
            switch type {
            case .IndexCorrection:
                self.dataSelected = IndexData.dataCorrectionIndex
                self.alertPickerView()
            case .PeriodFix:
                self.dataSelected = IndexData.dataPreAndPostFixed
                self.alertPickerView()
                break
            case .Result:
                self.getDataInputs()
                break
            }
        }
    }
    
    //MARK: Inicia os textField com valores na primeira posição do array
    func setInitial(){
        
        self.indexView.textFieldCorrectionIndex.text = IndexData.initialValueCorretion
        self.indexView.textFieldPreAndPostFixed.text = IndexData.initialValuePreAndPostFixed
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return IndexConstants.numberOfComponentsValue
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSelected.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let seleted = dataSelected[row]
        return seleted
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let type = self.typeData {
            if type == .IndexCorrection {
                self.indexView.textFieldCorrectionIndex.text = dataSelected[row]
            }else{
                self.indexView.textFieldPreAndPostFixed.text = dataSelected[row]
            }
        }
    }
    
    //MARK: Exibe um alert com o pickerView
    func alertPickerView() {
        let vc = UIViewController()
        vc.preferredContentSize = IndexConstants.areaPickerView
        let pickerView = UIPickerView(frame: IndexConstants.framePickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let alert = UIAlertController(title: IndexConstants.alertTitle, message: String.empty, preferredStyle: UIAlertController.Style.alert)
        alert.setValue(vc, forKey: IndexConstants.alertKey)
        alert.addAction(UIAlertAction(title: IndexConstants.alertButton, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func listennerKeyBoardCalcs() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        let contentInsets = UIEdgeInsets(top: KeyboardListenner.zeroCG, left: KeyboardListenner.zeroCG, bottom: keyboardSize.height , right: KeyboardListenner.zeroCG)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: KeyboardListenner.zeroCG, left: KeyboardListenner.zeroCG, bottom: KeyboardListenner.zeroCG, right: KeyboardListenner.zeroCG)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    private func getDataInputs() {
        guard let correctionIndex = self.indexView.textFieldCorrectionIndex.text else { return }
        guard let preAndPostFixed = self.indexView.textFieldPreAndPostFixed.text else { return }
        
        guard let valueInvest = self.indexView.textFieldValueInvest.text  else { return }
        let valueInvestDouble = NSString(string: valueInvest).doubleValue
        
        guard let dueDate = self.indexView.textFieldDueDate.text else { return }
        let dueDateInt = NSString(string: dueDate).integerValue
        
        guard let porcentYesarly = self.indexView.textFieldPorcentYearly.text else { return }
        let porcentYesarlyDouble = NSString(string: porcentYesarly).doubleValue
        
        let dataSubmit = IndexCalcSubmit(initial: valueInvestDouble, cdiPercent: porcentYesarlyDouble, profitabilityDefinition: preAndPostFixed, period: dueDateInt, type: correctionIndex)
        requestApi(dataSubmit: dataSubmit)
    }
    
    func requestApi(dataSubmit: IndexCalcSubmit) {
       let requestIndex = IndexCalcViewModel()
        requestIndex.requestCalc(dataSubmit) { (returnApi, error) in
            if let totalInvestment = returnApi?.data?.updatedInvestedAmount{
                DispatchQueue.main.async {
                    self.indexView.textFieldResult.text = totalInvestment
                }
            }
        }
    }
}

extension IndexViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var responseBolean = true
        let invalidCharacters = CharacterSet(charactersIn: ValueCalcsConstants.charactersAccepted).inverted
        responseBolean = string.rangeOfCharacter(from: invalidCharacters) == nil
        if responseBolean {
            let currentText = textField.text ?? String.empty
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= ValueCalcsConstants.limitCharacters
        }
        return responseBolean

    }
}

