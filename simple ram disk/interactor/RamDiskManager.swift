//
//  RamDiskManager.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

public protocol RamDiskManager: class {
    
    func create(_ volumeDetail: VolumeDetail!);
}
