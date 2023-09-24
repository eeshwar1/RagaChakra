//
//  RagaDetailsView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/24/23.
//

import SwiftUI

struct RagaDetailsView: View {
    
    var raga: Raga?
    var janyaRagas: [Raga]?
    
    var body: some View {
        
        HStack {
            VStack {
                
                if let raga = raga {
                    Text("\(raga.name)")
                    Text("\(raga.arohana)")
                    Text("\(raga.avarohana)")
                } else {
                    
                    Text("Name")
                    Text("Arohana")
                    Text("Avarohana")
                }
                
                VStack {
                    
                    if let janyaRagas = janyaRagas
                    {
                        ForEach(janyaRagas) { janyaRaga in
                            
                            Text(janyaRaga.name)
                            
                        }
                    } else {
                        
                        Text("None")
                    }
                }
                
            }.padding(10)
            
        }
        
    }
}

#Preview {
    
    RagaDetailsView(raga: Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S"))
}
