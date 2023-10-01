//
//  RagaDetailsView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/24/23.
//

import SwiftUI

struct RagaDetailsView: View {
    
    @Binding var raga: Raga?
    var janyaRagas: [Raga]?
    
    @Binding var selectedRaga: Raga?
    
    var body: some View {
        
        GeometryReader { geometry in
        
            VStack {
                VStack {
                    
                    RagaView(raga: raga)
                    
                }
                .padding(10)
                
                if let janyaRagas = janyaRagas {
                    
                    Text("\(janyaRagas.count) Janya Ragams")
                        .font(.title2.italic())
                }
         
                ScrollView {
                    
                    VStack {
                        
                        if let janyaRagas = janyaRagas
                        {
                            
                            ForEach(janyaRagas) { janyaRaga in
                                
                                Text(janyaRaga.name)
                                    .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.04: geometry.size.height * 0.04))
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(selectedRaga?.name == janyaRaga.name ? Color.green: Color.brown).cornerRadius(5)
                                    .shadow(color: Color.black, radius: 2, x: 2, y: -2)
                                    
                                    .onTapGesture {
                                        selectedRaga = janyaRaga
                                    }
                                    
                            }
                            
                        }
                       
                    }
                    .padding(10)

                }
                .scrollDisabled(false)
                .scrollIndicators(.never)
                
                
             
            }
            .frame(width: geometry.size.width, alignment: .center)
            .padding(10)
        
            
            
        }
        
    }
    
 
}

#Preview {
      
    RagaDetailsView(raga: .constant(Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S")), selectedRaga: .constant(Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S")))
}
