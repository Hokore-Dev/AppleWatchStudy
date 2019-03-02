//
//  InterfaceController.swift
//  MoviePlayer WatchKit Extension
//
//  Created by minjun.ha on 02/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var movie: WKInterfaceMovie!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let movieURL = Bundle.main.url(forResource: "izone", withExtension: "mp4")
        movie.setMovieURL(movieURL!)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
