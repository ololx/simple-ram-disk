//
//  ApplicationAssembly.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

protocol SimpleRamDiskAssembly: class {
    
    func configure(with viewController: SimpleRamDiskControllerImpl!)
}
