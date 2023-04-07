//
//  MainViewPresenter.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 6.04.23.
//

import UIKit
import SwiftyJSON

protocol MainViewPresenterProtocol: AnyObject {
    var usersCount: Int { get }
    func setupCell(for indexPath: IndexPath, cell: UITableViewCell)
    func loadData()
}

protocol MainViewControllerProtocol: AnyObject {

}

class MainViewPresenter: MainViewPresenterProtocol {
    
    unowned var viewController: MainViewControllerProtocol
    
    private var users = [User]()
    var usersCount: Int {
        return users.count
    }
    
    init(viewController: MainViewControllerProtocol) {
        self.viewController = viewController
        exportUsers()
    }
    
    private func exportUsers() {
        CoreDataManager.shared.exportUsers { [unowned self] users in
            self.users = users
        }
    }
    
    func setupCell(for indexPath: IndexPath, cell: UITableViewCell){
        guard !users.isEmpty,
              (0..<users.count).contains(indexPath.row) else { return }
        let user = users[indexPath.row]
        cell.config(mainText: user.username, secodaryText: user.email)
    }
    
    func loadData() {
        NetworkManager.shared.getData(from: .users) { data in
            let json = JSON(data)
            CoreDataManager.shared.importUsers(from: json)
            CoreDataManager.shared.exportUsers()
        }
    }
    
}
