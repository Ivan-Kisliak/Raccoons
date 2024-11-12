//
//  MarTableViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 8.11.24.
//

import UIKit

class MarTableViewController: UITableViewController {
    
    var raccoonDataManager: IRaccoonDataManageable?
    
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raccoonDataManager?.getIsMarkRaccoon().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? RaccoonCell else {
            return UITableViewCell()
        }
        
        if let raccoon = raccoonDataManager?.getIsMarkRaccoon()[indexPath.row] {

            cell.action = { myCell in
                guard let indexPath = tableView.indexPath(for: myCell) else { return }
                self.raccoonDataManager?.toogleCheckMark(raccoon)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            cell.selectionStyle = .none
            
            cell.configure(raccoon: raccoon)
        }
        
        return cell
    }
}

//MARK: - Settings
private extension MarTableViewController {
    func setup() {
        tableView.separatorStyle = .none
        view.backgroundColor = .gray
        tableView.register(RaccoonCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
