//
//  InterfaceController.swift
//  LifeCycle WatchKit Extension
//
//  Created by minjun.ha on 10/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var testLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("main ic awake")
    }
    
    override func willActivate() {
        super.willActivate()
        
        print("main ic will activate")
    }
    
    override func didAppear() {
        super.didAppear()
        
        print("main ic did appear")
    }
    
    override func willDisappear() {
        super.willDisappear()
        
        print("main ic will disappear")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        print("main ic did deactivate")
    }

    @IBAction func FirstICAction() {
        pushController(withName: "FirstInterface", context: nil)
    }
}
