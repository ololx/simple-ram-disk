//
//  ShScript.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.01.2021.
//

import Foundation

public class ShellScriptAdapter {
    
    private var script: Process!;
    
    required public init(args: [String]?) {
        self.script = Process.init();
        self.script.launchPath = "/bin/sh";
        self.script.arguments = args
    }
    
    public func execute() -> NSAppleEventDescriptor {
        self.script.launch()
        self.script.waitUntilExit()
        
        return NSAppleEventDescriptor.init(boolean: true);
    }
}
