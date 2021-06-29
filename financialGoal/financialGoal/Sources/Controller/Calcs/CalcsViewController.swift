//
//  CalcsViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//
import UIKit


public struct CalcsModel {
    let calcTypesName:[String]
    let imageIconsGallery: [String]
}

class CalcsViewController: UIViewController {
    
    //MARK: - Propertys
    var tableView = UITableView()
   
 
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTableView() {
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = .backgroundCustomGoal
        tableView.delegate = self
        tableView.separatorColor = .backgroundCustomGoal
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CalcsTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension CalcsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CalcsTableViewCell else { fatalError("Unable to create cell") }
        
        cell.iconImage.image = UIImage(named: calcTypes[tableView.tag].imageIconsGallery[indexPath.row])
        cell.calcLabel.text = calcTypes[tableView.tag].calcTypesName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}

