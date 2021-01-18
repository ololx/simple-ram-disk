//
//  ShellScript.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 15.01.2021.
//

import Foundation

public class ShellScript: ShellScriptProtocol {
    
    private var script: String!;
    
    required public init(source: String!) {
        self.script = "do shell script \"\(source!)\" with administrator privileges";
    }
    
    public func execute() -> NSAppleEventDescriptor {
        return self.getExecutable(script: self.script)?.executeAndReturnError(nil) ?? NSAppleEventDescriptor.init(boolean: true);
    }
    
    private func getExecutable(script: String!) -> Optional<NSAppleScript> {
        return NSAppleScript.init(source: script);
    }
}
