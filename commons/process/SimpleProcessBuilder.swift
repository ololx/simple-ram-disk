//
//  SimpleProcessBuilder.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class SimpleProcessBuilder: ProcessBuilder {
    
    private var process: Process!;
    
    public required init() {
        self.process = Process.init();
    }
    
    public required init(at laucnhPath: String!) {
        self.process = Process.init();
        self.process.launchPath = laucnhPath;
    }
    
    public func at(at laucnhPath: String!) -> ProcessBuilder {
        self.process.launchPath = laucnhPath;
        
        return self;
    }
    
    public func with(with arguments: [String]!) -> ProcessBuilder {
        self.process.arguments = arguments;
        
        return self;
    }
    
    public func with(with argument: String!) -> ProcessBuilder {
        self.process.arguments = [argument];
        
        return self;
    }
    
    public func build() -> Process {
        return self.process;
    }
}
