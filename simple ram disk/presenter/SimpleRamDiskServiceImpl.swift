//
//  SimpleRamDiskServiceImpl.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

public class SimpleRamDiskServiceImpl: SimpleRamDiskService {
    
    public static var DEFAULT_VOLUME_INFO: VolumeDetail = VolumeDetail.of(
        name: "MacintoshRamDisk",
        size: VolumeSize.init(
            value: 100,
            measure: VolumeSize.Measurement.MEGABYTE
        )
    );
    
    private weak var view: SimpleRamDiskControllerImpl!
    
    private var ramDiskManager: RamDiskManager!
    
    init(view: SimpleRamDiskControllerImpl!, interactor: RamDiskManager!) {
        self.view = view;
        self.ramDiskManager = interactor;
    }
    
    public func load() {
        self.view.nameInput.stringValue = SimpleRamDiskServiceImpl.DEFAULT_VOLUME_INFO.getName();
        self.view.sizeInput.intValue = SimpleRamDiskServiceImpl.DEFAULT_VOLUME_INFO.getValue()!.getValue();
        self.view.measureNameBox.stringValue = SimpleRamDiskServiceImpl.DEFAULT_VOLUME_INFO.getValue()!.getMeasure().rawValue;
    }
    
    func createRamDisk() {
        let volumeInfo = VolumeDetail.of(
            name: self.view.nameInput.stringValue,
            size: VolumeSize.init(
                value: self.view.sizeInput.intValue,
                measure: VolumeSize.Measurement.init(rawValue: self.view.measureNameBox.stringValue)!
            )
        );
        self.ramDiskManager.create(volumeInfo);
    }
}
