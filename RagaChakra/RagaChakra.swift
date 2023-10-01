//
//  RagaChakra.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/30/23.
//

import SwiftUI

struct RagaChakra: View {
    
    var melaRagas: [Raga] = []
    var action: (Raga) -> ()
    
    @State var selected: [String: Bool] =  [:]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(Array(melaRagas.enumerated()), id:\.offset) { index, raga in
                    
                    RagaPieSegment(angle: .degrees(Double( index * 5)), raga: raga, color: selected[raga.name] == true ? .green: (index%2 == 0 ? .gray : .brown))
                        .zIndex(selected[raga.name] == true ? 5: 1)
                        .onTapGesture {
                            
                            selectRaga(raga: raga)
                                                
                        }
                    
                }
                .onAppear( perform: {
                    
                    selected.keys.forEach{ selected[$0] = false }
                    
                })
                
            }
            
            
        }
    }
    
    func selectMelaRaga(raga: Raga) {
        
        self.action(raga)
        selected.keys.forEach{ selected[$0] = false }
        selected[raga.name] = true
        
    }
    
    func selectRaga(raga: Raga) {
        
        if (raga.mela_raga == "") {
            
            selectMelaRaga(raga: raga)
            
        } else {
            
            let mela_raga = melaRagas.filter { $0.name == raga.mela_raga }
            
            if mela_raga.count > 0 {
                selectMelaRaga(raga: mela_raga[0])
            }
            
        }
        
    }

    
}
