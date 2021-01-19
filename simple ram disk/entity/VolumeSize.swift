//
//  VolumeSize.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 19.01.2021.
//

import Foundation

public struct VolumeSize {
    
    public enum Measurement: String {
        case BYTE = "Byte"
        case MB = "MB"
        case GB = "GB"
    }
    
    //
    // The size origin value
    //
    private var value: Int64!
    
    //
    // The size origin measurement
    //
    private var measure: Measurement!
    
    public init() {
        self.init(byte: 0);
    }
    
    public init(byte: Int64!) {
        self.init(value: byte, measure: Measurement.BYTE);
    }
    
    public init(value: Int64!, measure: Measurement) {
        self.value = value;
        self.measure = measure;
    }
    
    
}
