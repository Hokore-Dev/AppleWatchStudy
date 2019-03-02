//
//  InterfaceController.swift
//  MusicPlayer WatchKit Extension
//
//  Created by minjun.ha on 02/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {

    var player: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Set up the session.
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .longForm,
                                    options: [])
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }
        
        // Set up the player.
        do {
            let filePath = Bundle.main.path(forResource: "audio", ofType: "wav")!
            let fileURL = URL.init(fileURLWithPath: filePath)
            player = try AVAudioPlayer(contentsOf: fileURL)
        } catch let error {
            print("*** Unable to set up the audio player: \(error.localizedDescription) ***")
            // Handle the error here.
            return
        }
        
        // Activate and request the route.
        session.activate(options: []) { (success, error) in
            guard error == nil else {
                print("*** An error occurred: \(error!.localizedDescription) ***")
                // Handle the error here.
                return
            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func stopAction() {
        player.pause()
    }
    
    @IBAction func playAction() {
        player.play()
    }
}
