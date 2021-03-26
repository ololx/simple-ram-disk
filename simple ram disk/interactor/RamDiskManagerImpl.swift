//
//  RamDiskManager.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 24.03.2021.
//

import Foundation

public class RamDiskManagerImpl: RamDiskManager {
    
    public func create(_ volumeDetail: VolumeDetail!) {
        SimpleSequencing.init()
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "-s")
                    .build()
            )
            .append(
                some: SimpleProcessBuilder.init(at: "/bin/sh")
                    .with(with: "./simple ram disk.app/Contents/Resources/resources/srdisk.sh")
                    .with(with: "-c")
                    .with(with: [volumeDetail.getName()!, String(volumeDetail.getValue()!.getValue(measure: VolumeSize.Measurement.MEGABYTE))])
                    .build(),
                actionType: Action.Method.LAUNCH_AND_WAIT
            )
            .execute();
    }
}
