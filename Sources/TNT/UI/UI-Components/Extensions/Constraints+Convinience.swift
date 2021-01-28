//
//  File.swift
//  
//
//  Created by .main on 2021-01-28.
//

import UIKit

public extension NSLayoutConstraint {
    
    func with(priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}
