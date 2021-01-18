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
        let diskSpace = self.calculateDiskSpace(self.sizeInput.intValue ?? 1, self.sizeTypeBox.stringValue ?? "MB");
        print(diskSpace);
        
        let script = ShellScript.init(source: "diskutil erasevolume JHFS+ 'RAM_Disk_512MB' `hdiutil attach -nomount ram://\(diskSpace)`");
        script.execute();
    }
    
    private func calculateDiskSpace(_ size: Int32!, _ type: String!) -> Int32 {
        
        if type == "B" {
            return (size / 1024) * 2048;
        } else if type == "GB" {
            return (size * 1024) * 2048;
        }
        
        return size * 2048;
    }
}

