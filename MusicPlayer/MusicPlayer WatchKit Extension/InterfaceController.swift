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

    var wkPlayer: WKAudioFilePlayer!
    var queuePlayer: WKAudioFileQueuePlayer!
    var playerItem: WKAudioFilePlayerItem!
    var player: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let filePath = Bundle.main.path(forResource: "audio", ofType: "wav")!
        let fileUrl = URL.init(fileURLWithPath: filePath)
        let asset = WKAudioFileAsset.init(url: fileUrl, title: "밍모닝", albumTitle: "VLive", artist: "izone")
        let playerItem1 = WKAudioFilePlayerItem(asset: asset)
        
        let filePath2 = Bundle.main.path(forResource: "audio2", ofType: "wav")!
        let fileUrl2 = URL.init(fileURLWithPath: filePath2)
        let asset2 = WKAudioFileAsset.init(url: fileUrl2, title: "쌈모닝", albumTitle: "VLive", artist: "izone")
        let playerItem2 = WKAudioFilePlayerItem(asset: asset2)
        
        var playerItems = [WKAudioFilePlayerItem]()
        playerItems.append(playerItem1)
        playerItems.append(playerItem2)
        queuePlayer = WKAudioFileQueuePlayer(items: playerItems)
        //wkPlayer = WKAudioFilePlayer(playerItem: playerItem)
        
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
        //player.pause()
        queuePlayer.pause()
    }
    
    @IBAction func playAction() {
        //player.play()
        switch queuePlayer.status {
        case .readyToPlay:
            queuePlayer.play()
            break
        case .failed:
            print("failed!")
            break
        case .unknown:
            print("unknown!")
        default: break
        }
    }
}
