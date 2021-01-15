//
//  ShellScript.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 15.01.2021.
//

import Foundation

public class ShellScript: ShellScriptProtocol {
    
    private var source: String!;
    
    required public init(source: String!) {
        self.source = source;
    }
    
    public func execute() {
    }
}
