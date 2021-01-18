//
//  ShellScriptProtocol.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 15.01.2021.
//

import Foundation

protocol ShellScriptProtocol: class {
    
    init(source: String!);
    
    func execute() -> NSAppleEventDescriptor;
}
