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
            
                if let raga = raga {
                    
                    RagaBlockView(raga: raga, selectedRaga: $selectedRaga, tapAction: { raga in
                        
                        selectedRaga = raga
                    })
                    .frame(height: 20)
                    .padding(10)
                }
               
                
                if let janyaRagas = janyaRagas {
                    
                    Text("\(janyaRagas.count) Janya Ragams")
                        .font(.title2.italic())
                }
         
                ScrollView {
                    
                    VStack {
                        
                        if let janyaRagas = janyaRagas
                        {
                            
                            ForEach(janyaRagas) { janyaRaga in
                                
                                RagaBlockView(raga: janyaRaga, selectedRaga: $selectedRaga, tapAction: { raga in
                                    
                                    selectedRaga = raga
                                })
                                .frame(height: 20)
                                .padding(5)
                                    
                            }
                            
                        }
                        
                       
                    }
                    .padding(20)

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
