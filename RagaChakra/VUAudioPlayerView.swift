//
//  VUAudioPlayerView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/30/23.
//

import SwiftUI

struct VUAudioPlayerView: View {
    
    var notes: [String]
    
    var backgroundColor: Color = .green
    
    @State var audioPlayer = VUAudioPlayer()
    
    var body: some View {
        
        Text("")
        Button(action:
        {
            self.audioPlayer.playNotes(notes: notes, withDelay: 0.4)
        }) {
            
            Image(systemName: "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.black)
         
        }
        .padding(10)
        .frame(width: 80, height: 80)
        .background(self.backgroundColor)
        .buttonStyle(PlainButtonStyle())
        
    }
    
    
    
}
