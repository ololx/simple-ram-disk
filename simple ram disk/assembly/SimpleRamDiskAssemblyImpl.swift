//
//  SimpleRamDiskAssembly.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

public class SimpleRamDiskAssemblyImpl: SimpleRamDiskAssembly {
    
    func configure(with viewController: SimpleRamDiskControllerImpl!) {
        //Create components
        let interactor = RamDiskManagerImpl.init();
        let presenter = SimpleRamDiskServiceImpl.init(view: viewController, interactor: interactor);
        
        //Inject components
        viewController.simpleRamDiskService = presenter;
    }
}
