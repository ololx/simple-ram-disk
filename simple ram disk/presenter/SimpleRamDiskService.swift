//
//  SimpleRamDiskService.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

protocol SimpleRamDiskService: class {
    
    func load();
    
    func createRamDisk();
}
