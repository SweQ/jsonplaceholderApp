//
//  UITableViewCell + config.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 6.04.23.
//

import UIKit

extension UITableViewCell {
    func config(mainText: String?, secodaryText: String?) {
        var config = self.defaultContentConfiguration()
        config.text = mainText
        config.secondaryText = secodaryText
        self.contentConfiguration = config
    }
}
