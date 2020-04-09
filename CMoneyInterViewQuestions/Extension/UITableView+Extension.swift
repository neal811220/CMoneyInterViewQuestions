//
//  UITableView+Extension.swift
//  CMoneyInterViewQuestions
//
//  Created by Neal on 2020/4/7.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerContentDetailCell(tableView: UITableView) {
        
        tableView.register(ContentDetailTableViewCell.self, forCellReuseIdentifier: ContentDetailTableViewCell.identifier)
    }
}
