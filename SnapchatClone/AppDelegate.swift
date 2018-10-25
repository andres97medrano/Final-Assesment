//
//  AppDelegate.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/20/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        /* PART 1 START */
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in })
        
        // Configure the notification's payload.
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Come back!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "You gotta keep your streak going!", arguments: nil)
        content.sound = UNNotificationSound.default()

        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
        
        // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
        /* PART 1 FINISH */
    }
}

