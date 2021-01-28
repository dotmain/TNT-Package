//
//  TableViewCell+Convinience.swift
//  
//
//  Created by .main on 2021-01-28.
//

import UIKit

///Convinience for register, reuse and get cell.
public extension UITableViewCell {
    
    private static var cellIdentifier: String { String(describing: self) }
    
    
    /// Register Canvas Cells
    /// - Parameter tableView: a UITableView
    static func register(for tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    /// Resuse Canvas Cells
    /// - Parameters:
    ///   - tableView:  UITableView
    ///   - indexPath:  IndexPath
    /// - Returns: UITableViewCell
    static func reuse(_ tableView: UITableView, indexPath: IndexPath) -> Self {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Self
        else {
            assertionFailure("Failed to deque a cell of type: \(cellIdentifier). Make sure to register using: \(cellIdentifier).register(for tableView: UITableView)")
            return Self.init()
        }
        return cell
    }
    
    /// Canvas Cells for Indexpath
    /// - Parameters:
    ///   - tableView:  UITableView
    ///   - indexPath:  IndexPath
    /// - Returns: UITableViewCell
    static func cell(_ tableView: UITableView, indexPath: IndexPath) -> Self? {
        tableView.cellForRow(at: indexPath) as? Self
    }
}

public protocol CellCanvasProtocol where Self: UITableViewCell {
    var cellHeigh: CGFloat { get }
}
