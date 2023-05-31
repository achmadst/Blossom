//
//  BreathingSummaryView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 25/05/23.
//

import SwiftUI

struct BreathingSummaryView: View {
    let breathing: Breathing
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Image("flower")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 48)
                Text("Blossom")
                    .font(.caption2)
                    .fontWeight(.semibold)
                Divider()
                TotalTime()
                Divider()
                HeartRate()
                Button(
                    action: {
                        self.rootPresentationMode.wrappedValue.dismiss()
                    }, label: {Text("Done")})
            }
            .padding()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TotalTime: View {
    var body: some View {
        VStack {
            Text("TOTAL TIME")
            Text("01:00")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.yellow)
                .padding(.bottom, -4)
        }
    }
}

struct HeartRate: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("HEART RATE")
            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 36)
                    .foregroundColor(.red)
                
                Text("\(HealthModel.shared.value)")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.red)
                
                Text("BPM")
                    .font(.custom("SF Compact", size: 24))
                    .fontWeight(.regular)
                    .foregroundColor(.red)
                
            }
        }
    }
}

struct BreathingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingSummaryView(breathing: breathings[0])
    }
}
