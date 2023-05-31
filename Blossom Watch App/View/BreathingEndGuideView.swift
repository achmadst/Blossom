//
//  BreathingEndGuideView.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI

struct BreathingEndGuideView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Button(
                action: {
                    dismiss()
                },
                label: {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 36)
                            .frame(maxWidth: 96, maxHeight: 56)
                            .opacity(0.20)
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 28)
                    }
                })
            .buttonStyle(.plain)
            .foregroundColor(.red)
            Text("End")
        }
        
    }
}

struct BreathingEndGuideView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingEndGuideView()
    }
}
