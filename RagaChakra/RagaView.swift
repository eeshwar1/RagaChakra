//
//  RagaView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/26/23.
//

import SwiftUI

struct RagaView: View {
    
    var raga: Raga?
    var backgroundColor: Color = .green
    
    var body: some View {
        
        if let raga = raga {
            VStack {
                
                
                if raga.mela_num == "" {
                    Text("\(raga.name)")
                        .font(.title2)
                    
                } else {
                    
                    Text("\(raga.mela_num) - \(raga.name)")
                        .font(.title)
                }
                
                Text("\(raga.arohana)")
                Text("\(raga.avarohana)")
            }
            .padding(5)
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: Color.black, radius: 2, x: 2, y: -2)
            
        }
          
    }
        
    
}
