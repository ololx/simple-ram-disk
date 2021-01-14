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
        
        let result = self.shell("diskutil erasevolume JHFS+ 'RAM_Disk_512MB' `hdiutil attach -nomount ram://\(diskSpace)`");
        print(result);
    }
    
    private func calculateDiskSpace(_ size: Int32!, _ type: String!) -> Int32 {
        
        if type == "B" {
            return (size / 1024) * 2048;
        } else if type == "GB" {
            return (size * 1024) * 2048;
        }
        
        return size * 2048;
    }
    
    private func shell(_ args: String!) -> String {
        var outstr = ""
        
        let task = Process()
        task.launchPath = "/usr/sbin/diskutil"
        task.arguments = [args ?? "echo fuck"]
        
        print(task.arguments);
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            outstr = output as String
        }
        
        task.waitUntilExit()
        
        return outstr
    }
    
    @discardableResult
    func shell2(_ args: String...) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }

}

