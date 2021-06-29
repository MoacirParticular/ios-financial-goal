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
        CustomData(title: "Calculadora", icon: #imageLiteral(resourceName: "IconCorrecaoIndice")),
        CustomData(title: "Simulador", icon: #imageLiteral(resourceName: "iconSimulador"))
    ]
    

    fileprivate let collectionView: UICollectionView = {
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
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
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
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.setupView(title: "teste")
        return cell
    }
    
    
}

class CustomCell: UICollectionViewCell {
    
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    func setupView(title: String) {
        setTitle()
        
        self.title.text = title
    }
    
    private func setTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 96),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .yellow

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
