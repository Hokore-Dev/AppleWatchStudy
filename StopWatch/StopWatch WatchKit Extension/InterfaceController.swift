//
//  InterfaceController.swift
//  StopWatch WatchKit Extension
//
//  Created by minjun.ha on 02/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var timer: WKInterfaceTimer!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
     
        //timer.setDate(Date)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        timer.setDate(Date(timeIntervalSinceNow: -60))
        timer.start()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
