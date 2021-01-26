//
//  ShScript.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.01.2021.
//

import Foundation

public class ShellScriptAdapter {
    
    public enum Launches: String {
        case SHELL = "/bin/sh"
        case BASH = "/bin/bash"
    }
    
    private var script: Process!;
    
    public convenience init(args: [String]?) {
        self.init(launch: Launches.BASH, args: args);
    }
    
    public init(launch: Launches, args: [String]?) {
        self.script = Process.init();
        self.script.launchPath = launch.rawValue;
        self.script.arguments = args
    }
    
    public func execute() -> NSAppleEventDescriptor {
        self.script.launch()
        
        return NSAppleEventDescriptor.init(boolean: true);
    }
    
    public func executeAndWait() -> NSAppleEventDescriptor {
        self.script.launch()
        self.script.waitUntilExit()
        
        return NSAppleEventDescriptor.init(boolean: true);
    }
    
    public func close() -> NSAppleEventDescriptor {
        self.script.terminate()
        
        return NSAppleEventDescriptor.init(boolean: true);
    }
}
