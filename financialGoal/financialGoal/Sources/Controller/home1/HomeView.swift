//
//  HomeView.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 28/06/21.
//

import UIKit

class HomeView: UIView {
    
    //MARK: Criando e aplicando constraints na ViewTop
     var topScreenView: UIView = {
        let viewTop = UIView()
        viewTop.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        viewTop.backgroundColor = .greenCustomGoal
        viewTop.layer.cornerRadius = IconsConstants.cornerRadiusConstant
        viewTop.layer.maskedCorners = [.layerMinXMaxYCorner]
        return viewTop
    }()
    
    func setTopScreenView(){
        addSubview(topScreenView)
      
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
    
        NSLayoutConstraint.activate([
            topScreenView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IconsConstants.constantZero),
            topScreenView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: IconsConstants.constantZero),
            topScreenView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IconsConstants.constantZero),
            topScreenView.heightAnchor.constraint(equalToConstant: screenHeight / IconsConstants.constantTwo)
        ])
    }
    
    //MARK: Icone notificação
    let buttonIconNotification: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        button.frame = FrameConstants.frameZero
        button.setImage(.imageIconNotification, for: .normal)
        return button
    }()
    
    func setButtonIconNotification(){
        addSubview(buttonIconNotification)
      
        NSLayoutConstraint.activate([
            buttonIconNotification.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IconsConstants.topAnchorNotification),
            buttonIconNotification.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IconsConstants.rightAnchorNotification),
        ])

    }
    
    //MARK: Icone calculadora topo
    let buttonIconCalculator: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        button.frame = FrameConstants.frameZero
        button.setImage(.imageIconCalculatorTop, for: .normal)
        return button
    }()
    
    func setButtonIconCalculator(){
        addSubview(buttonIconCalculator)
      
        NSLayoutConstraint.activate([
            buttonIconCalculator.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IconsConstants.topAnchorCalculator),
            buttonIconCalculator.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: IconsConstants.rightAnchorCalculator),
            buttonIconCalculator.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: IconsConstants.leftAnchorCalculator)
        ])

    }
    
    //MARK: Label
    lazy var labelNickName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        label.text = "Renilson Moreira"
        label.font = .fontNickNameHome
        label.textColor = .customColorResultLabel
        label.textAlignment = .center
        return label
    }()
    
    func setLabelNickName() {
        addSubview(labelNickName)
      
        NSLayoutConstraint.activate([
            labelNickName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: IconsConstants.topAnchorLabelNickname),
            labelNickName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: IconsConstants.constantZero),
            labelNickName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: IconsConstants.constantZero)
        ])
    }

    //MARK: Cria e seta elementos na view
    private func setView(){
        setTopScreenView()
        setLabelNickName()
        setButtonIconNotification()
        setButtonIconCalculator()
        self.backgroundColor = .backgroundCustomGoal
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
}