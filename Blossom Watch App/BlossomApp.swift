//
//  BlossomApp.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI
import WatchKit
import HealthKit
import UIKit
import AVFoundation

@main
struct Blossom_Watch_AppApp: App {
    @WKApplicationDelegateAdaptor var appDelegate: BlossomAppDelegate
    var healthModel = HealthModel()
    
    
    var body: some Scene {
        WindowGroup {
            BreathingView(healthModel: healthModel, breathing: breathings[0])
        }
    }
}


