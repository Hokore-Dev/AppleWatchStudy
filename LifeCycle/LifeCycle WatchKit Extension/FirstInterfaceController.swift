//
//  InterfaceController.swift
//  LifeCycle WatchKit Extension
//
//  Created by minjun.ha on 10/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class FirstInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("first ic awake")
    }
    
    override func willActivate() {
        super.willActivate()
        
        print("first ic will active")
    }
    
    override func didAppear() {
        super.didAppear()
        
        print("first ic did appear")
    }
    
    override func willDisappear() {
        super.willDisappear()
        
        print("first ic will disappear")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        print("first ic did deactivate")
    }
    
    @IBAction func secondICAction() {
        pushController(withName: "SecondInterface", context: nil)
    }
    
    @IBAction func mainICAction() {
        pop()
    }
}
