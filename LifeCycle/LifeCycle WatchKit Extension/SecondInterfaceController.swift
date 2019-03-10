//
//  InterfaceController.swift
//  LifeCycle WatchKit Extension
//
//  Created by minjun.ha on 10/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("second ic awake")
    }
    
    override func willActivate() {
        super.willActivate()
        
        print("second ic will active")
    }
    
    override func didAppear() {
        super.didAppear()
        
        print("second ic did appear")
    }
    
    override func willDisappear() {
        super.willDisappear()
        
        print("second ic will disappear")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        print("second ic did deactivate")
    }

    @IBAction func firstICAction() {
        pop()
    }
    
    @IBAction func mainICAction() {
        popToRootController()
    }
    
    @IBAction func mainSCICAction() {
        presentController(withName: "MainSecondInterface", context: nil)
    }
}
