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
        self.process.launchPath = "";
        self.process.arguments = [];
    }
    
    public required init(at laucnhPath: String!) {
        self.process = Process.init();
        self.process.launchPath = laucnhPath;
        self.process.arguments = [];
    }
    
    public func at(at laucnhPath: String!) -> ProcessBuilder {
        self.process.launchPath = laucnhPath;
        
        return self;
    }
    
    public func with(with arguments: [String]!) -> ProcessBuilder {
        self.process.arguments?.append(contentsOf: arguments);
        
        return self;
    }
    
    public func with(with argument: String!) -> ProcessBuilder {
        self.process.arguments?.append(argument);
        
        return self;
    }
    
    public func build() -> Process {
        return self.process;
    }
    
    private func prepare(_ input: String!) -> String! {
        return input.replacingOccurrences(of: " ", with: "_");
    }
}
