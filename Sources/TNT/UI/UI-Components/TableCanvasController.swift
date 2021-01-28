//
//  TableCanvasController.swift
//  
//
//  Created by .main on 2021-01-26.
//

import UIKit

/// The TableCanvasController class provides the infrastructure for managing the table views of your iOS apps.
open class TableCanvasController: UITableViewController {
    
    required public init?(coder: NSCoder) {
        super.init(style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    /// Called after the controller's view is loaded into memory.
    ///
    /// This override disables implicit CALayer animations, calls `setup()` and then re-enables animations.
    ///
    /// You should **not** override this method, instead use **setup()**.
    open override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = C4Grey
        ShapeLayer.disableActions = true
        self.setup()
        ShapeLayer.disableActions = false
        
    }

    /// Called during the controller's `viewDidLoad()` method.
    ///
    /// This method should be used to set up any objects or behaviours necessary when the controller's view loads.
    open func setup() {
    }

    #if os(iOS)
    ///  Overrides default behaviour of showing the app's status bar. Defaults to `true`
    ///
    /// - returns: a boolean value representing whether or not the app should hide its status bar
    open override var prefersStatusBarHidden: Bool {
        return true
    }
    #endif
}

