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
        
        let res = ShellScriptAdapter.init(args: ["./simple ram disk.app/Contents/Resources/resources/create_ram_disk.sh", volume.getName()!, String(volume.getValue()!.getValue(measure: VolumeSize.Measurement.MEGABYTE))]).execute();
        print(res)
    }
}

