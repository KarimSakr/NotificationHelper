//
//  NotificationPod.swift
//  NotificationPod
//
//  Created by I-MagineWorks Mac on 28/06/2022.
//

import Foundation
import UserNotifications

public class NotificationHandler{
    
    public init(){}
    
    //Schedule a notifiaction
    public func scheduleNotification(_ title:String, _ body:String, _ date:Int, _ uuid:String, _ center:UNUserNotificationCenter){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        //Date
        // Configure the recurring date.
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = date
               
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
                    dateMatching: dateComponents, repeats: true)
            
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
            center.add(request){(error) in
        }
    }
    
    // notify every x hour(s)
    public func timeIntervalNotification(_ title:String, _ body:String, _ time:Int, _ uuid:String, _ center:UNUserNotificationCenter){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
               
        // Create the trigger as a repeating event.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time * 60), repeats: true)
            
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
            center.add(request){(error) in
        }
    }
}
