//
//  IdentifiableView.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit

/// A Protocol that defines a reusable identifer for any view conforms to it
public protocol IdentifiableView: AnyObject {
    static var identifier: String { get }
}

public extension IdentifiableView where Self: UIView {
    /// Get the reuse identifier for the cell by using the class name
    static var identifier: String {
        return String(describing: self)
    }
}
