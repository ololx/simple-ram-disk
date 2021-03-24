//
//  ApplicationAssembly.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Cocoa

public protocol ApplicationAssembly: class {
    
    func configure(with viewController: NSViewController)
}
