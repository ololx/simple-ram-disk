//
//  ViewController.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 29.11.2020.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var nameInput: NSTextField!
    
    @IBOutlet weak var sizeInput: NSTextField!
    
    @IBOutlet weak var sizeTypeBox: NSComboBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                value: Int64(self.sizeInput.intValue),
                measure: VolumeSize.Measurement.init(rawValue: self.sizeTypeBox.stringValue)!
            )
        );
        let executable = ProcessChain.init()
            .append(some: SimpleProcessBuilder.init(at: "/bin/sh")
                        .with(with: "-s")
                        .build()
            )
            .append(some: SimpleProcessBuilder.init(at: "/bin/sh")
                        .with(with: "./simple ram disk.app/Contents/Resources/resources/srdisk.sh")
                        .with(with: "-c")
                        .with(with: [volume.getName()!, String(volume.getValue()!.getValue(measure: VolumeSize.Measurement.MEGABYTE))])
                        .build()
            );
        executable.execute();
        print(true);
    }
}

