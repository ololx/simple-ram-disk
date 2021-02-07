//
//  ProcessChain.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 31.01.2021.
//

import Foundation

public class ProcessChain {
    
    private var chain: [Process]!;
    
    public init() {
        self.chain = [];
    }
    
    public func append(some process: Process!) -> ProcessChain {
        self.chain.append(process);
        
        return self;
    }
    
    public func execute() {
        for (process) in chain  {
            print(process.arguments)
            process.launch();
        }
    }
}
