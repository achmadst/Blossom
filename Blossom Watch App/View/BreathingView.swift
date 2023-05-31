//
//  ContentView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI
import WatchKit


struct BreathingView: View {
    var healthModel: HealthModel
    
    @State var breathing: Breathing
    @State private var isActive : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(breathings) { breathing in
                    NavigationLink(destination: BreathingGuideView(breathing: breathing), isActive: self.$isActive) {
                        BreathingCellView(breathing: breathing)
                    }
                }
            }
            .listStyle(.carousel)
            .navigationTitle("Blossom")
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, self.$isActive)
    }
}


struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(healthModel: HealthModel(), breathing: breathings[0])
    }
}
