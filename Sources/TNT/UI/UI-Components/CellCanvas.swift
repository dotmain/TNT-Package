//
//  CellCanvas.swift
//  
//
//  Created by .main on 2021-01-26.
//

import Foundation
import ObjectiveC
import UIKit

private var canvasAssociationKey: UInt8 = 0

/// Extension to UITableViewCell that adds a `canvas` object.
///
/// The canvas is a View representation of the view controller's UIView property.
///
/// This extension adds properties and functionality of View to the native contoller object.
///
/// For example:
/// ````
/// canvas.backgroundColor = Color(r,g,b,a)
/// canvas.addTapGestureRecognizer(0.5){...}
/// ````
///
/// Where, `canvas` is essentially equal to `cell.canvas`, keeping the interaction with a controller's main view consistent with using other View objects.
public extension UITableViewCell {
    /// Returns a View object representation of the controller's `view` property.
    var canvas: View {
        if let canvas = objc_getAssociatedObject(self, &canvasAssociationKey) as? View {
            return canvas
        }

        let canvas = View(view: contentView)
        objc_setAssociatedObject(
            self,
            &canvasAssociationKey,
            canvas,
            .OBJC_ASSOCIATION_RETAIN)
        return canvas
    }
}

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
