//
//  InterfaceController.swift
//  SettingBundle WatchKit Extension
//
//  Created by minjun.ha on 06/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let userDefaults = UserDefaults(suiteName: "group.SettingBundle")
        let name = userDefaults?.string(forKey: "name_preference")
        if name != nil {
            nameLabel.setText(name)
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
