//
//  HomeView.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 28/06/21.
//

import UIKit

class HomeView: UIView {
    
    //MARK: Cria e seta elementos na view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
    
    private func setView(){
        setTopScreenView()
        setLabelNickName()
        setButtonIconNotification()
        setButtonIconCalculator()
        setButtonLastSimulation()
        setCollectionView()
        self.backgroundColor = .backgroundCustomGoal
    }
    
    //MARK: Criando e aplicando constraints na ViewTop
     var topScreenView: UIView = {
        let viewTop = UIView()
        viewTop.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        viewTop.backgroundColor = .greenCustomGoal
        viewTop.layer.cornerRadius = HomeConstants.cornerRadiusTopScreen
        viewTop.layer.maskedCorners = [.layerMinXMaxYCorner]
        return viewTop
    }()
    
    func setTopScreenView(){
        addSubview(topScreenView)
      
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
    
        NSLayoutConstraint.activate([
            topScreenView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: HomeConstants.constantZero),
            topScreenView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: HomeConstants.constantZero),
            topScreenView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: HomeConstants.constantZero),
            topScreenView.heightAnchor.constraint(equalToConstant: screenHeight / HomeConstants.constantTwo)
        ])
    }
    
    //MARK: Label nome ou apelido
    lazy var labelNickName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        label.text = HomeStringConstants.nickNameString
        label.font = .fontNickNameHome
        label.textColor = .customColorResultLabel
        label.textAlignment = .center
        return label
    }()
    
    func setLabelNickName() {
        addSubview(labelNickName)
      
        NSLayoutConstraint.activate([
            labelNickName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: HomeConstants.topAnchorLabelNickname),
            labelNickName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: HomeConstants.constantZero),
            labelNickName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: HomeConstants.constantZero)
        ])
    }
  
    //MARK: CollectionView
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: HomeStringConstants.identifier)
       return cv
   }()
    
    func setCollectionView(){
        addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let widthCollection = screenHeight / 2 - 75
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topScreenView.topAnchor, constant: widthCollection),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.45)
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
            buttonIconNotification.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: HomeConstants.topAnchorNotification),
            buttonIconNotification.rightAnchor.constraint(equalTo: self.rightAnchor, constant: HomeConstants.rightAnchorNotification),
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
            buttonIconCalculator.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: HomeConstants.topAnchorCalculator),
            buttonIconCalculator.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: HomeConstants.rightAnchorCalculator),
            buttonIconCalculator.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: HomeConstants.leftAnchorCalculator)
        ])

    }
    
    //MARK: Botão ultima visualização
    var buttonLastSimulation: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        button.backgroundColor = .customColorResultLabel
        button.layer.cornerRadius = 4
        button.setTitle(HomeStringConstants.textLastSimulation, for: .normal)
        button.titleLabel?.font = .fontLabelSubTitleRegular
        
        button.titleLabel?.numberOfLines = 2
        button.titleEdgeInsets = UIEdgeInsets(top: 25, left: 13, bottom: 61, right: 60)
        button.contentHorizontalAlignment = .left
        button.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        
        button.setTitleColor(.blackCustomGoal, for: .normal)
        button.setImage(.imageIconIoga, for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 27, left: 60, bottom: 27, right: 14)
        
        button.layer.shadowColor = UIColor.customColorShadow.cgColor
        button.layer.shadowOffset = CGSize(width: ShadowTextField.shadowWidth, height: ShadowTextField.shadowHeight)
        button.layer.shadowRadius = ShadowTextField.shadowRadius
        button.layer.shadowOpacity = ShadowTextField.shadowOpacity
       return button
   }()
   
   func setButtonLastSimulation(){
       addSubview(buttonLastSimulation)
   
       NSLayoutConstraint.activate([
        buttonLastSimulation.topAnchor.constraint(equalTo: self.topScreenView.bottomAnchor, constant: HomeConstants.bottomAnchorButtonSimulation),
        buttonLastSimulation.leftAnchor.constraint(equalTo: self.leftAnchor, constant: HomeConstants.leftAnchorButtonSimulation ),
        buttonLastSimulation.rightAnchor.constraint(equalTo: self.rightAnchor, constant: HomeConstants.rightAnchorButtonSimulation),
        buttonLastSimulation.heightAnchor.constraint(equalToConstant: HomeConstants.heightAnchorButtonSimulation)
       ])
   }
   
}
