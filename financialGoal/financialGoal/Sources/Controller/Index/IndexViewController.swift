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

    var dataCorrectionIndex = ["CDI", "SELIC", "Poupança", "TR"]
    var dataPreAndPostFixed = ["PRE", "POS"]
    var dataSelected = [String]()
    var typeData: EnumIndex?
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        navigationTitleConfig(title: "Correção por índice")
        listenIndex()
        setInitial()
    }
    
    override func loadView() {
        self.view = indexView
    }
    
    //MARK: Verifica o tipo do botão clicado
    func listenIndex() {
        indexView.onButtonCorrectionIndex = { type in
            self.typeData = type
            
            switch type {
            case .IndexCorrection:
                self.dataSelected = self.dataCorrectionIndex
                self.alertTest()
                
            case .PeriodFix:
                self.dataSelected = self.dataPreAndPostFixed
                self.alertTest()
                break
            }
        }
    }
    
    //MARK: Inicia os textField com valores na primeira posição do array
    func setInitial(){
        self.indexView.textFieldCorrectionIndex.text = dataCorrectionIndex[0]
        self.indexView.textFieldPreAndPostFixed.text = dataPreAndPostFixed[0]

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
    func alertTest() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        
        let editRadiusAlert = UIAlertController(title: "Selecione uma opção", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
    
        editRadiusAlert.addAction(UIAlertAction(title: "Selecionar", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
}


