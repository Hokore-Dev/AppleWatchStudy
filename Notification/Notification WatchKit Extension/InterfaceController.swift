//
//  InterfaceController.swift
//  Notification WatchKit Extension
//
//  Created by minjun.ha on 07/03/2019.
//  Copyright © 2019 thechamcham. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController, UNUserNotificationCenterDelegate {
    @IBOutlet weak var pushResult: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
            print(didAllow)
        })
        
        let firstAction = UNNotificationAction(identifier: "FIRST_ACTION",
                                                title: "귀여운 쪼율 보러가기",
                                                options: UNNotificationActionOptions.foreground)
        
        let secondAction = UNNotificationAction(identifier: "SECOND_ACTION",
                                                title: "예쁜 쪼율 보러가기",
                                                options: UNNotificationActionOptions.foreground)
        
        let meetingInviteCategory =
            UNNotificationCategory(identifier: "myCategory", actions: [firstAction, secondAction], intentIdentifiers: [], options: .customDismissAction)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([meetingInviteCategory])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "FIRST_ACTION":
            pushResult.setText("짠 귀여운 쪼율")
            break
            
        case "SECOND_ACTION":
            pushResult.setText("짠 예쁜 쪼율")
            break
            
        default:
            break
        }
        
        completionHandler()
    }

    @IBAction func registAction() {
        let content = UNMutableNotificationContent()
        content.title = "마 이게 타이틀이다"
        content.subtitle = "서브 타이틀은 어디?"
        content.body = "바디바디"
        content.badge = 1
        content.categoryIdentifier = "myCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats:false)
        
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
