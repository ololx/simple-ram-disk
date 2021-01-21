//
//  VolumeSize.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 19.01.2021.
//

import Foundation

public struct VolumeSize {
    
    //
    // The measurements enum
    //
    public enum Measurement: String {
        case KILOBYTE = "kB"
        case BYTE = "B"
        case MEGABYTE = "MB"
        case GYGABYTE = "GB"
        
        var order: Int {
            switch self {
            case .KILOBYTE:
                return 1
            case .BYTE:
                return 2
            case .MEGABYTE:
                return 3
            case .GYGABYTE:
                return 4
            }
        }
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
    
    public func getValue() -> Int64! {
        return self.value;
    }
    
    public func getValue(measure: Measurement!) -> Int64! {
        let diff = self.measure.order - measure.order;
        let multiplier = (pow(1024, abs(diff)) as NSDecimalNumber).int64Value;
        
        if (diff > 0) {
            return self.getValue() * multiplier;
        } else if (diff < 0) {
            return self.getValue() / multiplier;
        } else {
            return self.getValue();
        }
    }
}
