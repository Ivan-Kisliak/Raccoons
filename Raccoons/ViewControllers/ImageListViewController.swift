//
//  ImageListViewController.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 7.11.24.
//

import UIKit

class ImageListViewController: UIViewController {
   
    var raccoonDataManager: IRaccoonDataManageable?
    
    let cellIdentifier = "cellIdentifier"
    let tableView = UITableView()

//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        
    }
    
}

//MARK: - Setting View
private extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupTableView()
        
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - Setting Layout
private extension ImageListViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        raccoonDataManager?.getAllRacoons().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        
        if let raccoons = raccoonDataManager?.getAllRacoons() {
            configuration.text = raccoons[indexPath.row].imageName
            configuration.image = UIImage(named: raccoons[indexPath.row].imageName)
            cell.accessoryType = raccoons[indexPath.row].isMark ? .checkmark : .none
        }
        
        cell.contentConfiguration = configuration
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(
            style: .destructive, title: "Delete") { _, _, completion in
                self.raccoonDataManager?.removeRaccoon(index: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                completion(true)
            }
        
        let markAction = UIContextualAction(style: .normal, title: "Mark") { _, _, completion in
            
            self.raccoonDataManager?.changeMarkRaccoon(index: indexPath.row)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            completion(true)
        }
        
        markAction.backgroundColor = .systemGreen
        
        let configuration = UISwipeActionsConfiguration(
            actions: [deleteAction, markAction]
        )
        return configuration
    }
}



