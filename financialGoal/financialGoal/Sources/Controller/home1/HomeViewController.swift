//
//  HomeViewController.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 22/06/21.
//

import UIKit

struct CustomData {
    var title: String
    var icon: UIImage
}

class HomeViewController: UIViewController {
    
    let data = [
        CustomData(title: "Calculadora", icon: .iconMoneyCalc),
        CustomData(title: "Simulador", icon: #imageLiteral(resourceName: "iconSimulador"))
    ]

     let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    var homeView = HomeView(frame: FrameConstants.frameZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeActivity()

        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        
        let screenSize = UIScreen.main.bounds
        var screenHeight = screenSize.height
        
        let widthCollection = screenHeight / 2 - 75
        
        collectionView.topAnchor.constraint(equalTo: self.homeView.topScreenView.topAnchor, constant: widthCollection).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.45).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
        return CGSize(width: 109, height: 124)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.setupView(title: data[indexPath.row].title, icon: data[indexPath.row].icon)
        cell.layer.cornerRadius = 20

        return cell
    }
    
    
}

