//
//  ShScript.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.01.2021.
//

import Foundation

public class ShScript {
    
    private var script: Process!;
    
    required public init(source: String!) {
        self.script = Process.init();
        self.script.launchPath = "/bin/ls";
        self.script.arguments = ["simple ram disk.app/Contents/MacOS/simple\\ ram\\ disk"]
    }
    
    public func execute() -> NSAppleEventDescriptor {
        self.script.launch()
        self.script.waitUntilExit()
        
        return NSAppleEventDescriptor.init(boolean: true);
    }
}
