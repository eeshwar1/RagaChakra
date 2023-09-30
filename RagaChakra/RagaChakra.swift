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
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(Array(melaRagas.enumerated()), id:\.offset) { index, raga in
                    
                    RagaPieSegment(angle: .degrees(Double( index * 5)), raga: raga, color: index%2 == 0 ? .green : .brown)
                        .offset(x: 0, y: 0)
                        .onTapGesture {
                            
                            self.action(raga)
                            
                        }
                    
                    
                    
                }
                
            }
            
            
        }
    }
    
}
