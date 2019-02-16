//
//  DetailInterfaceController.swift
//  TableView WatchKit Extension
//
//  Created by minjun.ha on 16/02/2019.
//  Copyright © 2019 minjun.ha. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfacecontroller : WKInterfaceController {
    
    @IBOutlet weak var detailLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let detailData = context as? String {
            detailLabel.setText(detailData)
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
