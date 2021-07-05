//
//  CalcsTableView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//


import UIKit

class CalcsTableView: UIView {
    
    let calcType:[String] = ["Investimento com aplicação mensal","Investimento com aplicação única","Correção de valor por um índice","Conversão de taxas"]
    let calcImages:[String] = ["investimentoMensal","aplicacaoUnica","correcaoIndice","conversaoTaxas"]
    
    
    //MARK: Constants
    let kCell = "NewsTableViewCell"
    
    //MARK: Propertys
    var tableView = UITableView()

    
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        setConstraintsTableView()
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.register(CalcsTableView.self, forCellReuseIdentifier: kCell)
        
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setConstraintsTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}

//MARK: - TableViewDelegate
extension CalcsTableView: UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

//MARK: - TableViewDataSource
extension CalcsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCell, for: indexPath as IndexPath) as! CalcsTableViewCell
        
        let calcs = calcType[indexPath.row]
        cell.setupView(title: "TESTE", subTitle: "SUBTITULO")
        return cell
    }
}
