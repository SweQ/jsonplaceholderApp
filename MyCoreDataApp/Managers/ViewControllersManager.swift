//
//  ViewsManager.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 7.04.23.
//

import UIKit

class ViewControllersManager {
    static var shared = ViewControllersManager()
    private init() { }
    
    enum ViewCountrollerType {
        case main
    }
    
    func createViewController(_ type: ViewCountrollerType) -> UIViewController? {
        switch type {
        case .main:
            let vc = MainViewController()
            vc.presenter = MainViewPresenter(viewController: vc)
            return vc
        }
    }
}
