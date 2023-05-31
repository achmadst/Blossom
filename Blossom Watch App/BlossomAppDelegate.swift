//
//  BlossomAppDelegate.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import Foundation
import WatchKit
import HealthKit


class BlossomAppDelegate: NSObject, WKApplicationDelegate {
    var healthModel = HealthModel()
    
    
    func applicationDidFinishLaunching() {
        //Tells the delegate that the launch process is almost done and the app is almost ready to run.
        healthModel.requestAuthorization { success in
            if !success {
                print("Access not granted!")
            }
        }
        healthModel.startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }
    
    func applicationDidBecomeActive() {
        //Tells the delegate that the watchOS app is visible and processing events.
        
    }
    func applicationWillResignActive() {
        //Tells the delegate that the system is about to deactivate the watchOS app.
        
    }
    func applicationWillEnterForeground() {
        //Tells the delegate that the app is about to transition from the background to the foreground.
        
    }
    func applicationDidEnterBackground() {
        //Tells the delegate that the app has transitioned from the foreground to the background.
        
    }
    func deviceOrientationDidChange() {
        //Tells the delegate that the device’s orientation has changed.
        
    }
    
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompletedWithSnapshot(false)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(false)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(false)
            case let relevantShortcutTask as WKRelevantShortcutRefreshBackgroundTask:
                // Be sure to complete the relevant-shortcut task once you're done.
                relevantShortcutTask.setTaskCompletedWithSnapshot(false)
            case let intentDidRunTask as WKIntentDidRunRefreshBackgroundTask:
                // Be sure to complete the intent-did-run task once you're done.
                intentDidRunTask.setTaskCompletedWithSnapshot(false)
            default:
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }
}
