//
//  ShellScriptProtocol.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 15.01.2021.
//

import Cocoa

protocol ShellScriptProtocol: class {
    
    init(source: String!);
    
    func execute();
}
