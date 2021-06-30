//
//  CalcsViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//
import UIKit

class CalcsViewController: UIViewController {
    
    //MARK: - Propertys
    var tableView = UITableView()
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        navigationTitleConfig(title: StringConstantsCalcs.screenTitleCalcs )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Aplicando propriedades na Tableview
    func setTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = .backgroundCustomGoal
        tableView.delegate = self
        tableView.separatorColor = .backgroundCustomGoal
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CalcsTableViewCell.self, forCellReuseIdentifier: StringConstants.cellIdentifier)
    }
}

    //MARK: Números de linhas da sessão da tabela
extension CalcsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CalcsTypes.calcTypes[tableView.tag].calcTypesName.count
    }

    //MARK: Aplicando Propriedades na Célula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.cellIdentifier, for: indexPath) as? CalcsTableViewCell else { fatalError(StringConstants.fatalErroCell) }
        cell.iconImage.image = UIImage(named: CalcsTypes.calcTypes[tableView.tag].imageIconsGallery[indexPath.row])
        cell.calcLabel.text = CalcsTypes.calcTypes[tableView.tag].calcTypesName[indexPath.row]
        cell.backgroundView = UIView(backgroundColor: .colorBackgroundCell)
        cell.backgroundView?.addSeparator()
        cell.selectedBackgroundView?.addSeparator()
        return cell
    }
    
    //MARK: Aplicando tamanho de altura da linha da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ValueCalcsConstants.valueHeightForRowAt
    }
  
}
    //MARK: Criando separador entre as linhas da TableView
private extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

    func addSeparator() {
        let frame = CGRect(x: ValueCalcsConstants.valueXFrameSeparator, y: bounds.height - ValueCalcsConstants.separatorHeight, width: bounds.width, height: ValueCalcsConstants.separatorHeight)
        let separator = UIView(frame: frame)
        separator.backgroundColor = .backgroundCustomGoal
        separator.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        addSubview(separator)
    }
}

