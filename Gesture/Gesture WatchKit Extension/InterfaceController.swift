//
//  InterfaceController.swift
//  Gesture WatchKit Extension
//
//  Created by minjun.ha on 04/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    
    var counter: Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func handleSwipe(_ sender: Any) {
        label.setText("Swipe \(String(describing: counter))")
        counter += 1
    }
    @IBAction func handleTap(_ sender: Any) {
        label.setText("Tap \(String(describing: counter))")
        counter += 1
    }
    @IBAction func handleLongPress(_ sender: Any) {
        label.setText("Long Press \(String(describing: counter))")
        counter += 1
    }
    @IBAction func handlePan(_ sender: Any) {
        label.setText("Pan \(String(describing: counter))")
        counter += 1
    }
}
