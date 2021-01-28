//
//  UIView+Constraints.swift
//  
//
//  Created by .main on 2021-01-28.
//

import UIKit

public extension UIView {
    
    enum TNTLayoutGuide {
        case none
        case layoutMarginsGuide
        case safeAreaGuide
        case frameLayoutGuide
        case contentLayoutGuide
    }
    
    func pinToSuperView(guide: TNTLayoutGuide,
                        edges: UIRectEdge = .all,
                        layoutMargins: UIEdgeInsets? = nil,
                        contentEdgeInset: UIEdgeInsets = .zero,
                        priority: UILayoutPriority = .required) {
        guard
            let superview = superview
        else { return }
        let layoutGuide: UILayoutGuide? = uiLayoutGuide(for: guide)
        var constraints: [NSLayoutConstraint] = []
        
        if let layoutMargins = layoutMargins {
            superview.layoutMargins = layoutMargins
        }
        
        if edges.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: layoutGuide?.topAnchor ?? superview.topAnchor,
                                                    constant: contentEdgeInset.top).with(priority: priority))
        }
        
        if edges.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: layoutGuide?.bottomAnchor ?? superview.bottomAnchor,
                                                    constant: contentEdgeInset.bottom).with(priority: priority))
        }
        
        if edges.contains(.left) {
            constraints.append(leadingAnchor.constraint(equalTo: layoutGuide?.leadingAnchor ?? superview.leadingAnchor,
                                                    constant: contentEdgeInset.left).with(priority: priority))
        }
        
        if edges.contains(.right) {
            constraints.append(trailingAnchor.constraint(equalTo: layoutGuide?.trailingAnchor ?? superview.trailingAnchor,
                                                    constant: contentEdgeInset.right).with(priority: priority))
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func uiLayoutGuide(for guide: TNTLayoutGuide) -> UILayoutGuide? {
        switch guide {
        case .none: return nil
        case .safeAreaGuide: return safeAreaLayoutGuide
        case .layoutMarginsGuide: return layoutMarginsGuide
        case .frameLayoutGuide:
            guard
                let scrollView = self as? UIScrollView
            else {
                assertionFailure("FrameLayoutGuide requiers a scrollView")
                return nil
            }
            return scrollView.frameLayoutGuide
        case .contentLayoutGuide:
            guard
                let scrollView = self as? UIScrollView
            else { assertionFailure("FrameLayoutGuide requiers a scrollView")
                return nil
            }
            return scrollView.contentLayoutGuide
        }
    }
    
    var constrainedBased: Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
