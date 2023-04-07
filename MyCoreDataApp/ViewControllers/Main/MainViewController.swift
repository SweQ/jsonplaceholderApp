//
//  ViewController.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 5.04.23.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    var presenter: MainViewPresenter?
    
    private var tableView: UITableView!
    private var constants = ConstantsManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        
        presenter?.loadData()
        createTableView()
    }
    
    func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: constants.tableCellId
        )
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.usersCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: constants.tableCellId,
            for: indexPath
        )
        presenter?.setupCell(for: indexPath, cell: cell)
        return cell
    }
}
