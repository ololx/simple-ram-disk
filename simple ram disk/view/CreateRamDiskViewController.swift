//
//  ViewController.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 29.11.2020.
//

import Cocoa

class ViewController: NSViewController {
    
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
            name: "TEST_DISK_1",
            size: VolumeSize.init(
                value: Int64(self.sizeInput.intValue),
                measure: VolumeSize.Measurement.init(rawValue: self.sizeTypeBox.stringValue)!
            )
        );
        let script = ShellScript.init(source: "diskutil erasevolume JHFS+ '\(volume.getName()!)' `hdiutil attach -nomount ram://\(2048 * volume.getValue()!.getValue(measure: VolumeSize.Measurement.MEGABYTE))`");
        print(script.execute());
    }
}

