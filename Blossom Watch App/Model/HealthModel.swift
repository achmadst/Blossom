//
//  HealthModel.swift
//  Blossom Watch App
//
//  Created by measthmatic on 25/05/23.
//

import Foundation
import HealthKit
import WatchKit

class HealthModel: ObservableObject {
    static let shared = HealthModel()
    
    var healthStore: HKHealthStore = HKHealthStore()
    var breathingStartTime: Date?
    
    let heartRateQuantity = HKUnit(from: "count/min")
    @Published var value = 0
//    @Published var highHeartRateEventData: [HKCategorySample] = []
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            fatalError("HealthKit not available on this platform!")
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let writeType = Set([HKObjectType.categoryType(forIdentifier: .mindfulSession)!,
                           HKObjectType.quantityType(forIdentifier: .heartRate)!])
        let readType = Set([HKObjectType.workoutType(),
                           HKCategoryType(.highHeartRateEvent)])
        
        healthStore.requestAuthorization(toShare: writeType, read: readType) { success, error in
            if success {
                completion(true)
            } else {
                print("Failed to request authorization: \(error?.localizedDescription ?? "")")
                completion(false)
            }
        }
        
        
        
    }
    
    
    func savemindfulDuration(duration: TimeInterval) {
        let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession)!
        
        let mindfulSample = HKCategorySample(type: mindfulType, value: HKCategoryValue.notApplicable.rawValue, start: Date(), end: Date(timeIntervalSinceNow: duration))
        
        healthStore.save(mindfulSample) { success, error in
            if success {
                print("Mindful duration saved successfully.")
            } else {
                print("Failed to save Mindful duration: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    // Start the breathing activity
    func startBreathing() {
        breathingStartTime = Date()
    }
    
    // End the breathing activity and save the duration
    func endBreathing() {
        guard let startTime = breathingStartTime else {
            print("Mindful activity was not started.")
            return
        }
        
        let duration = Date().timeIntervalSince(startTime)
        savemindfulDuration(duration: duration)
        
        // Reset the start time for the next handwashing activity
        breathingStartTime = nil
    }
    
    func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        
        // 1
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        // 2
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            // 3
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            
            self.process(samples, type: quantityTypeIdentifier)
            
        }
        
        // 4
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        // 5
        
        healthStore.execute(query)
    }
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
            
            self.value = Int(lastHeartRate)
        }
    }
    
}

