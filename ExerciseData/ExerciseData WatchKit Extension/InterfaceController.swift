//
//  InterfaceController.swift
//  ExerciseData WatchKit Extension
//
//  Created by minjun.ha on 20/02/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var activityRing: WKInterfaceActivityRing!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        let activitySummary = HKActivitySummary()
        
//        activitySummary.activeEnergyBurned = HKQuantity(unit: HKUnit.smallCalorie(), doubleValue: 200)
//        activitySummary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.smallCalorie(), doubleValue: 300)
//
//        activitySummary.appleExerciseTime = HKQuantity(unit: HKUnit.minute(), doubleValue: 20)
//        activitySummary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.minute(), doubleValue: 30)
//
//        activitySummary.appleStandHours = HKQuantity(unit: HKUnit.count(), doubleValue: 5)
//        activitySummary.appleStandHoursGoal = HKQuantity(unit: HKUnit.count(), doubleValue: 12)
        
//        activityRing.setActivitySummary(activitySummary, animated: true)
        sampleShow()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func sampleShow() {
        let healthStore = HKHealthStore()
        
        let objectTypes: Set<HKObjectType> = [
            HKObjectType.activitySummaryType()
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: objectTypes) { (success, error) in
            
            // Authorization request finished, hopefully the user allowed access!
            print(success)
        }
        
        let calendar = Calendar.autoupdatingCurrent
        
        var dateComponents = calendar.dateComponents(
            [ .year, .month, .day ],
            from: Date()
        )
        
        // This line is required to make the whole thing work
        dateComponents.calendar = calendar
        
        let predicate = HKQuery.predicateForActivitySummary(with: dateComponents)
        
        let query = HKActivitySummaryQuery(predicate: predicate) { (query, summaries, error) in
            
            guard let summaries = summaries, summaries.count > 0
                else {
                    // No data returned. Perhaps check for error
                    return
            }
            
            // Handle the activity rings data here
            let summary = summaries[0]
            self.activityRing.setActivitySummary(summary, animated: true)
        }
        
        healthStore.execute(query)
    }
}
