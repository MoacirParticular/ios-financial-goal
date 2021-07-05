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
    var dataPicker = ["CDI", "SELIC", "Poupança", "TR"]
    
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        navigationTitleConfig(title: "Calculo por indice")
        listenIndex()
        setInitial()
    }
    
    override func loadView() {
        self.view = indexView
    }
    
    func listenIndex() {
        indexView.onButtonCorrectionIndex = { type in
            switch type {
            case .IndexCorrection:
                self.alertTest()
            case .PeriodFix:
                break
            }
        }
    }
    func setInitial(){
        self.indexView.textFieldCorrectionIndex.text = dataPicker[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      let seleted = dataPicker[row]
        return seleted
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.indexView.textFieldCorrectionIndex.text = dataPicker[row]

    }
    
    func alertTest() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        
        let editRadiusAlert = UIAlertController(title: "Selecione um índice", message: "", preferredStyle: UIAlertController.Style.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
    
        editRadiusAlert.addAction(UIAlertAction(title: "Selecionar", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
}


