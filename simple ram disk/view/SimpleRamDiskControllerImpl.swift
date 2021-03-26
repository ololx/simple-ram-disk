//
//  ViewController.swift
//  simple ram disk
//
//  Created by Alexander A. Kropotin on 29.11.2020.
//

import Cocoa

class SimpleRamDiskControllerImpl: NSViewController, SimpleRamDiskController {
    
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
        self.simpleRamDiskService.createRamDisk();
    }
}
