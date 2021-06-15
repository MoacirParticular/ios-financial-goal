//
//  SignInView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/06/21.
//

import UIKit

class SignInView: UIView {
    
    // MARK: - Attributes
    
    // label
    let lbSubtitle: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Coisas desse tipo"
        label.font = UIFont(name: "helvetica", size: 30)
        return label
    }()
    
    let lbDescription: UILabel = {
        let label = UILabel()
        UIView.configInitailElements(label)
        label.text = "Descrição do campo"
        label.font = UIFont(name: "helvetica", size: 16)
        return label
    }()
    
    //TextField
    let txtField: UITextField = {
       let tField = UITextField()
        UIView.configInitailElements(tField)
        tField.borderStyle = .roundedRect
        tField.addShadow()
//        tField.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        tField.layer.shadowOpacity = 0.2
        tField.placeholder = "algo a ser digitado"
        return tField
    }()
    
    let bttnContinue: UIButton = {
        let bttn = UIButton()
        UIView.configInitailElements(bttn)
        bttn.backgroundColor = .blackCustomGoal
        bttn.layer.cornerRadius = 6
        bttn.setTitleColor(.white, for: .normal)
        bttn.setTitle("Continue", for: .normal)
        return bttn
    }()
    
    // MARK: - Methods/ Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createView() {
        self.backgroundColor = .backgroundCustomGoal
        alignLbSubtitle()
        alignLbDescription()
        alignTxtField()
        alignBttnContinue()
    }
    func alignLbSubtitle() {
        self.addSubview(lbSubtitle)
        NSLayoutConstraint.activate([
            lbSubtitle.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            lbSubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    func alignLbDescription() {
        self.addSubview(lbDescription)
        NSLayoutConstraint.activate([
            lbDescription.topAnchor.constraint(equalTo: lbSubtitle.bottomAnchor, constant: 20),
            lbDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        ])
    }
    func alignTxtField() {
        self.addSubview(txtField)
        NSLayoutConstraint.activate([
            txtField.topAnchor.constraint(equalTo: lbDescription.bottomAnchor, constant: 20),
            txtField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            txtField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            txtField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func alignBttnContinue() {
        self.addSubview(bttnContinue)
        NSLayoutConstraint.activate([
            bttnContinue.topAnchor.constraint(equalTo: txtField.bottomAnchor, constant: 20),
            bttnContinue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bttnContinue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            bttnContinue.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
extension UITextField {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
