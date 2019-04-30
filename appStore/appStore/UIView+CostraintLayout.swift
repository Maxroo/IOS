//
//  UIView+CostraintLayout.swift
//  appStore
//
//  Created by admin on 2019-04-29.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import UIKit

extension UIView {
    func matchParent(padding: UIEdgeInsets = .zero ){
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBotAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBotAnchor, constant: -padding.bottom).isActive = true
        }
        if let superTraillingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTraillingAnchor, constant: -padding.right).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
    }
}
