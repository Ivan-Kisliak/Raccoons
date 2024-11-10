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
        
        tableView.register(CustomRaccoonCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raccoonDataManager?.getIsMarkRaccoon().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomRaccoonCell else {
            return UITableViewCell()
        }
        
        if let raccoon = raccoonDataManager?.getIsMarkRaccoon()[indexPath.row] {
            cell.configure(raccoon: raccoon)
        }
        
        cell.actionCheckMarkButton = { cell in
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            if let raccoon = self.raccoonDataManager?.getIsMarkRaccoon()[indexPath.row] {
                self.raccoonDataManager?.toogleCheckMark(raccoon)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
}
