//
//  ContentView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var melaRagas = ReadData().ragas.filter( {$0.mela_raga == ""})
    @State var ragas = ReadData().ragas
    
    @State var raga: Raga?
    @State var janyaRagas: [Raga]?
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 10) {
                ZStack {
                    
                    ForEach(Array(melaRagas.enumerated()), id:\.offset) { index, raga in
                        
                        RagaPie(angle: .degrees(Double( index * 5)), raga: raga, color: index%2 == 0 ? .blue : .gray)
                            .frame(width: geometry.size.width/5, height: geometry.size.width/5, alignment: .center)
                            .onTapGesture {
                                self.raga =  raga
                                self.janyaRagas = Array(ragas.filter( { $0.mela_raga == raga.name }).map( {$0} ))
                            }
                        
                    }
                }.padding(10)
            
        
                RagaDetailsView(raga: self.raga, janyaRagas: self.janyaRagas)
                    .frame(width: geometry.size.width/5, height: geometry.size.width/5, alignment: .center)
                    .offset(x: geometry.size.width/5, y: 0)
    
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .border(.blue)
        }
    }
}

struct RagaPie: View {
    
    var angle: Angle
    var raga: Raga
    var color: Color
    
    var body: some View {
        
        GeometryReader { (geometry) in
            
            ZStack {
                
                PieSegment(start: .zero, end: .degrees(5))
                    .fill(color)
                    .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                    .contentShape(PieSegment(start: .zero, end: .degrees(5)))
                    .rotationEffect(.degrees(-90) + angle)
                   
                Text("\(raga.name)")
                    .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.04: geometry.size.height * 0.04))
                    .foregroundStyle(.white)
                    .frame(width: 2 * geometry.size.width, height: geometry.size.width, alignment: .trailing)
                    .rotationEffect(.degrees(-87) + angle)
                    .padding(5)
                
            
            }
        }
       
    }
    
}
#Preview {
    
   //  "name": "Kanakāngi(Janaka raga)", "mela_raga": "", "mela_num": "1", "link": "https://en.wikipedia.org/wiki/Kanakangi", "arohana": "S R1 G1 M1 P D1 N1 Ṡ", "avarohana": "Ṡ N1 D1 P M1 G1 R1 S"},

    ContentView(raga: Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S"))
}
