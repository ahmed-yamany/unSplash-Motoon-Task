//
//  +dequeHelper.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit


/// Extend the UITableView class with two helper methods
extension UITableView {
    /// Register a cell class with the table view and associate it with a reuse identifier
    func register<T: UITableViewCell>(_ class: T.Type) where T: IdentifiableView {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// Dequeue a reusable cell of a specified class from the table view
    func dequeueReusableCell<T: UITableViewCell>(_ class: T.Type, for indexPath: IndexPath) -> T where T: IdentifiableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(T.identifier), make sure the cell is registered with table view")
        }
        return cell
    }
}
