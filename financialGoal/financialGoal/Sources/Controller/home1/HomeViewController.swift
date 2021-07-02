//
//  HomeViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 22/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var onScreenSelected: ((_ setSelected: LoginActionType ) -> Void)?
    var onButtonActionView: ((_ screenName: String) -> Void)?
    var lastScreen: String = String.empty
    
    let data = [
        CustomData(title: HomeStringConstants.calculator, icon: .iconMoneyCalc),
        CustomData(title: HomeStringConstants.simulator, icon: .iconSimulator)
    ]
    
    var homeView = HomeView(frame: FrameConstants.frameZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeActivity()
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        listennerLastSimulator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let screenCalc = UserDefaults.standard.value(forKey: StringConstantsCalcs.forKeyCals) as? String{
            self.homeView.setButtonLastSimulatorAndImage()
            lastScreen = screenCalc
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func listennerLastSimulator() {
        homeView.buttonActionView = {
            self.onButtonActionView?(self.lastScreen)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenHeigth = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let widthCustom = screenWidth / HomeConstants.threeFortyFour
        let heightCustom = screenHeigth / HomeConstants.fiveThirtySeven
        
        return CGSize(width: widthCustom, height: heightCustom)//
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStringConstants.identifier, for: indexPath) as! CustomCell
        cell.setupView(title: data[indexPath.row].title, icon: data[indexPath.row].icon)
        cell.backgroundColor = .colorOrangeCollection
        
        cell.layer.cornerRadius = HomeConstants.cornerRadiusFourCell
        cell.layer.shadowColor = UIColor.customColorShadow.cgColor
        cell.layer.shadowOffset =  CGSize(width: HomeConstants.shadowOffSetWidthCell, height: HomeConstants.shadowOffSetHeightCell )
        cell.layer.shadowRadius = HomeConstants.shadowRadiusCell
        cell.layer.shadowOpacity = HomeConstants.shadowOpacityCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              
        if data[indexPath.row].title == HomeStringConstants.simulator{
            showDefaultAlert(.Warning, .SimulatorUnavailable)
        }else{
            self.onScreenSelected?(.Calcs)
        }
    }
}

