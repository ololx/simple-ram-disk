//
//  SimpleRamDiskAssembly.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Cocoa

public class SimpleRamDiskAssembly: ApplicationAssembly {
    
    public func configure(with viewController: NSViewController) {
        //Create components
        /*let sbcService = SbcService.init(view: viewController);
        let bluetoothAudioDefaults = BluetoothAudioDefaults.init(presenter: sbcService);
        let sbcBitpoolExpanderDefaults = SbcBitpoolExpanderDefaults.init(presenter: sbcService);*/
        
        //Inject components
        /*viewController.scbService = sbcService;
        sbcService.bluetoothAudioDefaults = bluetoothAudioDefaults;
        sbcService.sbcBitpoolExpanderDefaults = sbcBitpoolExpanderDefaults;*/
    }
}
