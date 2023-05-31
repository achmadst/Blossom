//
//  BreathingExplainView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI

struct BreathingExplainView: View {
    let breathing: Breathing
    
    var body: some View {
        ScrollView{
            Text(breathing.explain)
                .font(.caption2)
            
            .padding()
            Spacer()
            
        }
    }
}

struct BreathingExplainView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingExplainView(breathing: breathings[0])
    }
}
