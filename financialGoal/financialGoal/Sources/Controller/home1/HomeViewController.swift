//
//  HomeViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 22/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let data = [
        CustomData(title: HomeStringConstants.calculadora, icon: .iconMoneyCalc),
        CustomData(title: HomeStringConstants.simulador, icon: .iconSimulator)
    ]
    
    var homeView = HomeView(frame: FrameConstants.frameZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeActivity()
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func loadView() {
        self.view = homeView
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HomeConstants.widthCell, height: HomeConstants.heightCell)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStringConstants.identifier, for: indexPath) as! CustomCell
        cell.setupView(title: data[indexPath.row].title, icon: data[indexPath.row].icon)
        cell.backgroundColor = .colorOrangeCollection
        cell.layer.cornerRadius = HomeConstants.cornerRadiusFour

        return cell
    }
    
}

