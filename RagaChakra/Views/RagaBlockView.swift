//
//  RagaBlockView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 12/24/23.
//

import SwiftUI


struct RagaBlockView: View {
    
    var raga: Raga
    var backgroundColor: Color = .green
    @Binding var selectedRaga: Raga?
    
    var tapAction: (Raga) -> ()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                Text(raga.name)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width : geometry.size.height ))
                    .foregroundStyle(.white)
                    
            }
            .padding(5)
            .background((selectedRaga == raga) ? Color.green: Color.brown).cornerRadius(5)
            .shadow(color: Color.black, radius: 2, x: 2, y: -2)
            .onTapGesture {
                tapAction(raga)
            }
            
                
        }
    }
}
