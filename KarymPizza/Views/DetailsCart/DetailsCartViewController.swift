//
//  DetailsCartViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 19.12.2022.
//

import UIKit

class DetailsCartViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        title = "Оформлення замовлення"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailOrderCell.self, forCellReuseIdentifier: DetailOrderCell.id)
        tableView.separatorStyle = .none
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0: return 1
//        case 1: return 1
//        case 2: return 1
//        case 3: return 1
//        case 4: return 1
//        default: return 0
//        }
        return 5

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailOrderCell.id, for: indexPath) as? DetailOrderCell else { return UITableViewCell() }
        cell.viewForCell(index: indexPath)
        return cell
    }
    
    
}
