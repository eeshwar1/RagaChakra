//
//  ContentView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var ragas = ReadData().ragas
    @State var melaRagas = ReadData().ragas.filter( {$0.mela_raga == ""})
    
    @State var raga: Raga?
    @State var janyaRagas: [Raga]?
    
    @State var selectedRaga: Raga?
    
    @State var searchText: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            
          
            VStack {
                
                HStack(spacing: 20) {
                    
                    RagaChakra(melaRagas: melaRagas, action: self.ragaAction(raga:))
                        .frame(width: geometry.size.width/4 - 20, height: geometry.size.width/4 - 20, alignment: .center)
                        .padding(10)
                        .shadow(color: Color.black, radius: 1, x: 1, y: -1)
        
                    RagaDetailsView(raga: self.$raga, janyaRagas: self.janyaRagas, selectedRaga: $selectedRaga)
                        .frame(width: geometry.size.width/4, alignment: .center)
                        .padding(20)
                        .offset(x: geometry.size.width/5, y: 0)
                        
                    
                    if let selectedRaga = selectedRaga {
                        
                        VStack {
                            RagaView(raga: selectedRaga)
                                .frame(width: geometry.size.width/5, height: geometry.size.height/5, alignment: .center)
                                .offset(x: geometry.size.width/5, y: 0)
                            
                        }
                    }
        
                }
                .frame(width: geometry.size.width, height: geometry.size.height - 50, alignment: .leading)
            }
            
            }
        .searchable(text: $searchText) {
            
            ForEach(searchResults, id: \.id) { result in
                
                Text("\(result.name)").searchCompletion(result)
                
                    .onTapGesture {
                        
                        self.ragaAction(raga: result)
                        
                    }
                }

        }
    }
    
    var searchResults: [Raga] {
        
           if searchText.isEmpty {
               
               return []

           } else {
               
               let filteredRagas = ragas.filter { $0.name.lowercased().unaccent().contains(searchText.lowercased()) }
               return filteredRagas
           }
    }
    
    
    func melaRagaAction(raga: Raga) {
        
        self.raga =  raga
        self.janyaRagas = Array(ragas.filter( { $0.mela_raga == raga.name } ).map( {$0} ))
        self.selectedRaga = nil
        
    }
    
    func ragaAction(raga: Raga) {
        
        if raga.mela_raga == "" {
            
            self.melaRagaAction(raga: raga)
            
        } else {
            
            let mela_raga = melaRagas.filter { $0.name == raga.mela_raga }
            
            if mela_raga.count > 0 {
                self.melaRagaAction(raga: mela_raga.first!)
            }
            self.selectedRaga = raga
            
        }
        
    }
}


#Preview {
    

    ContentView(raga: Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S"))
}
