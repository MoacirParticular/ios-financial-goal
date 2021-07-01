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
        setImageIoga()
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
        label.text = SignInData.nickname
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
        cv.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        cv.register(CustomCell.self, forCellWithReuseIdentifier: HomeStringConstants.identifier)
        return cv
    }()
    
    func setCollectionView(){
        addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        var widthCollection = screenHeight
        
        //Verifica o tamanho do device e centraliza a collection de acordo com a view
        if UIScreen.main.bounds.height > PageAndScrollConstants.deviceScreenSizeCollection {
            widthCollection = screenHeight / HomeConstants.numberTwoCv - HomeConstants.numberSeventyFourCv
        }else{
            widthCollection = screenHeight / HomeConstants.numberTwoCv - HomeConstants.numberSeventyCv
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topScreenView.topAnchor, constant: widthCollection),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: HomeConstants.numberFortyFourCv),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: HomeConstants.numberMinusFortyCv),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: HomeConstants.numberZeroFortyFiveCv)
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
        button.layer.cornerRadius = HomeConstants.cornerRadiusLasSimulation
        button.setTitle(HomeStringConstants.textLastSimulation, for: .normal)
        button.titleLabel?.font = .fontLabelSubTitleRegular
        button.titleLabel?.numberOfLines = HomeConstants.numberLinesLastSimulation
        button.titleEdgeInsets = UIEdgeInsets(top: HomeConstants.topButton, left: HomeConstants.leftButton, bottom: HomeConstants.bottomButton, right: HomeConstants.rightButton)
        button.contentHorizontalAlignment = .left
        button.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        button.setTitleColor(.blackCustomGoal, for: .normal)
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
    
    //MARK: imagem Ioga Ultima simulacao
     var imageIoga: UIImageView = {
        let img = UIImageView(image: .imageIconIoga)
        img.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        return img
    }()
    
    func setImageIoga() {
        addSubview(imageIoga)
        
        NSLayoutConstraint.activate([
            imageIoga.topAnchor.constraint(equalTo: self.buttonLastSimulation.topAnchor, constant: HomeConstants.topAnchorImageIoga),
            imageIoga.rightAnchor.constraint(equalTo: self.buttonLastSimulation.rightAnchor, constant: HomeConstants.rightAnchorImageIoga)
        ])
    }
   
}
