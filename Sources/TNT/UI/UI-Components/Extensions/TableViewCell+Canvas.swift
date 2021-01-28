//
//  TableViewCell+Canvas.swift
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
