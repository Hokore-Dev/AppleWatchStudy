//
//  InterfaceController.swift
//  Alert WatchKit Extension
//
//  Created by minjun.ha on 06/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func showAlert() {
        
        let firstAction = WKAlertAction(title: "Yes", style: .default) {
            self.label.setText("Yes")
        }
        
        let secondAction = WKAlertAction(title: "No", style: .destructive) {
            self.label.setText("No")
        }
        
        let thirdAction = WKAlertAction(title: "s", style: .cancel) {
            self.label.setText("s")
        }
        
        presentAlert(withTitle: "타이틀", message: "메시지", preferredStyle: .alert, actions: [firstAction, secondAction, thirdAction])
    }
}
