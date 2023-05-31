//
//  BreathingGuideView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI
import WatchKit
import HealthKit



struct BreathingGuideView: View {
    let breathing: Breathing
    @State var pageIndex = 1
    @State private var show: Bool = false
    
    //    @State var present = 0
    
    public let durationSet: Double = 62
    
    var body: some View {
        TabView(selection: $pageIndex) {
            BreathingEndGuideView().tag(0)
            BreathingBox(pageIndex: $pageIndex).tag(1)
            //            Text(breathing.name).tag(1)
            
            
        }
        .navigationBarBackButtonHidden(true)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear {
            HealthModel.shared.startBreathing()
            DispatchQueue.main.asyncAfter(deadline: .now() + durationSet) {
                self.show = true
                HealthModel.shared.endBreathing()
                
            }
            
        }
//        .navigationDestination(isPresented: $show) {
//            BreathingSummaryView(breathing: breathing)
//        }
        NavigationLink(destination: BreathingSummaryView(breathing: breathing), isActive: $show, label: {})
                    .buttonStyle(.plain)
    }
}

