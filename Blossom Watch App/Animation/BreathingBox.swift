//
//  Breathing_Box.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI

struct BreathingBox: View {
    @State var lottieFile: String = "Blossom2"
    @ObservedObject var viewModel: LottieFileManager = .init()
    @State var texts = "Inhale with your Nose"
    @State var count = 0
 
    @State private var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @Binding var pageIndex: Int
    let durationSet = 60
    
    var body: some View {
        VStack(spacing: -8) {
            Image(uiImage: viewModel.image)
                .resizable()
                .frame(minWidth: 120)
                .scaledToFit()
            Text(texts)
                .multilineTextAlignment(.center)
            
            
            
        }
        .frame(minWidth: 120)
        .onAppear() {
            if pageIndex == 1 {
                self.viewModel.loadAnimationFromFile(filename: lottieFile)
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                
            }

        }
        .onReceive(timer) { _ in
            // Update the texts array with your custom text here
                if count == 4 {
                    self.texts = "Hold your Breath"
                } else if count == 8 {
                    self.texts = "Exhale with your Mouth"
                } else if count >= 12 {
                    self.texts = "Inhale with your nose"
                    return count = 0
                }
                count += 1
               
        }
        .onDisappear() {
            if pageIndex == 0 {
                self.viewModel.loadAnimationFromFile(filename: lottieFile)
//                self.timer.upstream.connect().cancel()
            }
        }
    }
}


//struct BreathingBox_Previews: PreviewProvider {
//    static var previews: some View {
//        BreathingBox(pageIndex: $pageIndex)
//    }
//}
