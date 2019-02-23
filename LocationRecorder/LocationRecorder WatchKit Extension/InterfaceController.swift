//
//  InterfaceController.swift
//  LocationRecorder WatchKit Extension
//
//  Created by minjun.ha on 23/02/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate{
    
    var myLocation: CLLocationCoordinate2D?
       var session:WCSession?
    
    @IBOutlet weak var map: WKInterfaceMap!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        session = WCSession.default
        session?.delegate = self
        session?.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let location = CLLocationCoordinate2D(latitude: 59.436499, longitude: 24.742994)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        map.setRegion(region)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch WCSession Activated")
            
            updateMyLocation(applicationContext: session.applicationContext)
            
        case .notActivated:
            print("Watch WCSession Not Activated")
        case .inactive:
            print("Watch WCSession InActivated")
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        updateMyLocation(applicationContext: applicationContext)
    }
    
    func updateMyLocation(applicationContext: [String : Any]) {
        if let iphoneContext = applicationContext as? [String : CLLocationDegrees] {
            if iphoneContext["latitude"] != nil && iphoneContext["longitude"] != nil {
                let latitude = iphoneContext["latitude"] as! Double
                let longitude = iphoneContext["longitude"] as! Double
                
                self.myLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: self.myLocation!, span: span)
                
                self.map.setRegion(region)
                self.map.addAnnotation(self.myLocation!, with: .red)
            }
        }
    }

}
