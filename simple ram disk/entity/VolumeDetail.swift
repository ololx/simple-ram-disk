//
//  VolumeDetail.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 14.01.2021.
//
import Foundation

public struct VolumeDetail {
    
    public static func of(name: String!, size: VolumeSize!) -> VolumeDetail {
        return VolumeDetail.init(name, size);
    }
    
    //
    // The volume name for file system
    //
    private var name: String!
    
    //
    // The volume size in messure
    //
    private var size: VolumeSize!
    
    public init(_ name: String!, _ size: VolumeSize!) {
        self.name = name;
        self.size = size;
    }
    
    public func getName() -> String! {
        return self.name!;
    }
    
    public func getValue() -> VolumeSize! {
        return self.size;
    }
}
