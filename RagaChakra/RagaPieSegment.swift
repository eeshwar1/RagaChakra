//
//  RagaPie.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/28/23.
//

import SwiftUI

struct RagaPieSegment: View {
    
    var angle: Angle
    var raga: Raga
    var color: Color
    @State var selected = false
    var body: some View {
        
        GeometryReader { (geometry) in
            
            ZStack {
                
//                PieSegment(start: .zero, end: .degrees(5))
//                    .fill(color)
//                    .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
//                    .contentShape(PieSegment(start: .zero, end: .degrees(5)))
//                    .rotationEffect(.degrees(-90) + angle)
        
                   
                PieSegmentTruncated(start: .zero, end: .degrees(5))
                                    .fill(color)
                                    .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                    .contentShape(PieSegment(start: .zero, end: .degrees(5)))
                                    .rotationEffect(.degrees(-90) + angle)
                Text("\(raga.name)")
                    .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.035: geometry.size.height * 0.035))
                    .truncationMode(.tail)
                    .fontWeight(selected ? .bold : .regular)
                    .foregroundStyle(.white)
                    .frame(width: 2 * geometry.size.width, height: geometry.size.width, alignment: .trailing)
                    .rotationEffect(.degrees(-87) + angle)
                    .padding(5)
                
            
            }
    
         
        }
       
    }
    
}
