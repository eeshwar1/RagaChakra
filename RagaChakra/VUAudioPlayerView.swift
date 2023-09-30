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
    
    @State var currentNote: String?
    
    @State var audioPlayer = VUAudioPlayer()
    
    @State var isPlaying = false
    
    var body: some View {
        
        HStack {
            
            if let note = currentNote {
                
                Text(note)
                    .font(.title)
                    .bold()
                    .frame(width: 80, height: 80, alignment: .center)
        
            }
            
            if isPlaying == false {
                
                    Button(action:
                            {
                        self.isPlaying = true
                        self.audioPlayer.playNotes(notes: notes, withDelay: 0.4)
                    }) {
                        
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                        
                    }
                    .padding(10)
                    .frame(width: 80, height: 80, alignment: .center)
                    .background(self.backgroundColor)
                    .buttonStyle(PlainButtonStyle())
                    .onAppear(
                        
                        perform: {
                            
                            self.audioPlayer.playingAction = self.setCurrentNote(note:)
                            self.audioPlayer.clearAction = self.clearCurrentNote
                            self.audioPlayer.doneAction = self.donePlaying
                        }
                    )
                }
                
                
            }
            
        
    }
    
    func setCurrentNote(note: String) {
        
        self.currentNote = note
        
    }
    
    func clearCurrentNote() {
        
        self.currentNote = nil
    }
    
    func donePlaying() {
        
        self.isPlaying = false
    }
}
