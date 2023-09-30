//
//  VUAudioPlayer.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/30/23.
//

import AVFoundation

class VUAudioPlayer: NSObject, AVAudioPlayerDelegate {

    var players = [String: AVAudioPlayer]()
    var duplicatePlayers = [AVAudioPlayer]()
    
    var noteNames = [ "S",  "Ṡ",  "R1",
                      "R2", "R3",
                      "G1", "G2", "G3",
                      "M1", "M2",
                      "P",
                      "D1", "D2", "D3",
                      "N1", "N2", "N3"]
    
    var notesData: [String: Data] = [:]
    
    override init() {
        
        super.init()
        
        loadNotes()
    }
  
    func loadNotes() {
        
        for noteName in noteNames {
            
            if let notePath = Bundle.main.path(forResource: noteName, ofType: "mp3") {
                
                let noteURL = NSURL(fileURLWithPath: notePath)
                
                do {
                    
                    let noteData = try Data(contentsOf: noteURL as URL)
                    self.notesData[noteName] = noteData
                    do {
                        let player = try AVAudioPlayer(data: noteData)
                        self.players[noteName] = player
                        player.prepareToPlay()
                    }
                    catch {
                        print("Could not create player for: \(noteName)")
                    }
                }
                catch {
                    print("Could not load data for note: \(noteName)")
                }
        
            } else {
                
                print("Cannot find file for noteName")
            }
           
        }
        
    }
    
    func playNotes(notes: [String], withDelay: Double)
    {
        var lastDelay = 0.0
        for (index, note) in notes.enumerated() {
  
            let delay = withDelay*Double(index)
            lastDelay = delay
            let _ = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(playNoteNotification(notification:)), userInfo: ["note":note], repeats: false)
        }
        lastDelay = lastDelay + withDelay
        let _ = Timer.scheduledTimer(timeInterval: lastDelay, target: self, selector: #selector(donePlaying(notification:)), userInfo: nil, repeats: false)
       
    }
    
    @objc func donePlaying(notification: NSNotification) {
         
         
     }
    @objc func playNoteNotification(notification: NSNotification) {
        
         if let note = notification.userInfo?["note"] as? String {
        
             playNote(note)
             
         }
         
     }
    
    func playNote(_ note: String) {
        
        guard let noteData = self.notesData[note] else {
            print("Could not find data for note \(note). Exiting")
            return
        }
        
        if let player = players[note] { // player for sound has been found
            
            if player.isPlaying == false {
                // player is not in use, so use that one
                player.prepareToPlay()
                player.play()
            } else {
                
                // player is in use, create a new, duplicate player and use that instead
                // use try! because we know the URL worked before
                // let duplicatePlayer = try! AVAudioPlayer(contentsOf: noteURL as URL)
                let duplicatePlayer = try! AVAudioPlayer(data: noteData)
                
                // assign delegate for duplicatePlayer so delegate can remove the duplicate once it has stopped playing
                
                duplicatePlayer.delegate = self
                
                // add duplicate to array so it does not get removed from memory before finishing
                duplicatePlayers.append(duplicatePlayer)
                
                duplicatePlayer.prepareToPlay()
                duplicatePlayer.play()
                
                
            }
            
        }
        else {
                
                // player has not been found, create a new player with the URL if possible
                do {
                    let player = try AVAudioPlayer(data: noteData)
                    self.players[note] = player
                    player.prepareToPlay()
                    player.play()
                    
                } catch {
                    print("Could not play note: \(note)")
                }
            }
        
        
    }
    
  
    @objc func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = duplicatePlayers.firstIndex(of: player) {
            duplicatePlayers.remove(at: index)
        }
  
    }
    
    
    
}
