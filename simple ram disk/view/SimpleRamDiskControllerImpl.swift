//
//  ViewController.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 29.11.2020.
//

import Cocoa

class SimpleRamDiskControllerImpl: NSViewController {
    
    @IBOutlet weak var nameInput: NSTextField!
    
    @IBOutlet weak var sizeInput: NSTextField!
    
    @IBOutlet weak var measureNameBox: NSComboBox!
    
    //The view configurator
    let configurator: SimpleRamDiskAssembly = SimpleRamDiskAssemblyImpl.init();
    
    //The service instance
    var simpleRamDiskService: SimpleRamDiskService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Configure view
        configurator.configure(with: self)
        
        //Setup form initional values
        simpleRamDiskService.load()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func createDisk(_ sender: Any) {
        let volume = VolumeDetail.of(
            name: self.nameInput.stringValue,
            size: VolumeSize.init(
                value: self.sizeInput.intValue,
                measure: VolumeSize.Measurement.init(rawValue: self.measureNameBox.stringValue)!
            )
        );
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
                    .with(with: [volume.getName()!, String(volume.getValue()!.getValue(measure: VolumeSize.Measurement.MEGABYTE))])
                    .build(),
                actionType: Action.Method.LAUNCH_AND_WAIT
            )
            .execute();
    }
}

