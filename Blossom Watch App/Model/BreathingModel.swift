//
//  BreathingModel.swift
//  Blossom Watch App
//
//  Created by measthmatic on 24/05/23.
//

import SwiftUI

struct Breathing: Identifiable {
    var id: String { name }
    let name: String
    let time: String
    let symbolName: String
    let explain: String
}

let breathings = [
    Breathing(name: "4-7-8 Breathing", time: "1 Minutes", symbolName: "lungs.fill", explain: """
Sit or lie down in a comfortable position. Let your lips part. Make a whooshing sound, exhaling completely through your mouth.

Close your lips, inhaling silently through your nose as you count to four in your head.
    
Then, for seven seconds, hold your breath.
    
Make another whooshing exhale from your mouth for eight seconds and repeat.
"""),
    Breathing(name: "Box Breathing", time: "1 Minutes", symbolName: "lungs.fill", explain: """
Prior to beginning, sit with your back in a comfortable chair, with your feet planted firmly on the floor. Close your eyes.

Begin by slowly exhaling all of your air out.

Gently inhale for four counts through your nose, hold for four counts, and exhale four counts through your mouth.

Wait for four counts and repeat.
"""),
]
