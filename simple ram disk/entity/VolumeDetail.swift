//
//  VolumeDetail.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 14.01.2021.
//

public struct VolumeDetail {
    
    public static func of(name: String!, size: Int64!) -> VolumeDetail {
        return VolumeDetail.init(name, size);
    }
    
    //
    // The volume name for file system
    //
    private var name: String!
    
    //
    // The volume size in messure
    //
    private var size: Int64!
    
    public init(_ name: String!, _ size: Int64!) {
        self.name = name;
        self.size = size;
    }
}
