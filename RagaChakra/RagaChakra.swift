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
                            
                            self.action(raga)
                            selected.keys.forEach{ selected[$0] = false }
                            selected[raga.name] = true
                                                
                        }
                    
                }
                .onAppear( perform: {
                    
                    selected.keys.forEach{ selected[$0] = false }
                    
                })
                
            }
            
            
        }
    }
    
}
