//
//  BreathingCellView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI

struct BreathingCellView: View {
    let breathing: Breathing
    @State private var show: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                ZStack {
                    Circle()
                        .frame(maxWidth: 48, maxHeight:48)
                        .opacity(0.24)
                    Image(systemName: breathing.symbolName)
                        .resizable()
                        .scaledToFit()
                    .frame(maxWidth: 30, maxHeight:30)
                    
                }
                .foregroundColor(Color("AccentColor"))
                .padding(.bottom, 8)
                
                Text(breathing.name)
                    .fontWeight(.semibold)
                
                Text(breathing.time)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("AccentColor"))
            }
            Spacer()
            NavigationLink(destination: BreathingExplainView(breathing: breathing),
                           isActive: $show,
                           label: {
                ZStack {
                    Circle()
                        .frame(maxWidth: 30, maxHeight:30)
                        .opacity(0.16)
                        .foregroundColor(Color("AccentColor"))
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("AccentColor"))
                        .frame(maxWidth: 18, maxHeight:18)
                }})
                .buttonStyle(.plain)
            
                
            .onTapGesture {
                self.show.toggle()
            }
            .padding(.bottom, 8)
            
        }
        .padding(.vertical, 11)
    }
}

struct BreathingCellView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingCellView(breathing: breathings[0])
    }
}
