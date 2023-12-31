//
//  ContentView.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var ragas = ReadData().ragas
    @State var melaRagas = ReadData().ragas.filter( {$0.isMela})
    
    @State var raga: Raga?
    @State var janyaRagas: [Raga]?
    
    @State var selectedRaga: Raga?
    
    @State var searchText: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            
          
            VStack {
                
                HStack(spacing: 20) {
                    
                    RagaChakraView(melaRagas: melaRagas, selectedRaga: $selectedRaga, action: self.ragaAction(raga:))
                        .frame(width: geometry.size.width/4 - 20, height: geometry.size.width/4 - 20, alignment: .center)
                        .padding(20)
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
            
          
                Text("\(searchResults.count) ragas")
                    .italic()
                    .foregroundStyle(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.7))
                ForEach(searchResults, id: \.id) { result in
                    
                    
                    Text("\(result.name)").searchCompletion(result)
                    
                    
                        .fontWeight(result.isMela ? .bold : .none)
                        .frame(width: 280, alignment: .leading)
                        .padding(5)
                        .contentShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.5)
                                
                        )
                        .onTapGesture {
                            
                            self.ragaAction(raga: result)
                            
                        }
                }
                
            }
        
    }
    
    var searchResults: [Raga] {
        
           if searchText.isEmpty {
               
               return ragas

           } else {
               
               let filteredRagas = ragas.filter { $0.name.lowercased().unaccent().contains(searchText.lowercased()) }
               return filteredRagas
           }
    }
    
    
    func ragaAction(raga: Raga) {
        
        self.selectedRaga = raga
        if raga.isMela {
            
            self.melaRagaAction(raga: raga)
            
        } else {
            
            let mela_raga = melaRagas.filter { $0.name == raga.mela_raga }
            
            if mela_raga.count > 0 {
                self.melaRagaAction(raga: mela_raga.first!)
            }
            
            
        }
        
    }
    
    func melaRagaAction(raga: Raga) {
        
        self.raga =  raga
        self.janyaRagas = Array(ragas.filter( { $0.mela_raga == raga.name } ).map( {$0} ))
             
    }
}


#Preview {
    

    ContentView(raga: (Raga(name: "Kanakāngi(Janaka raga)", mela_raga: "", mela_num: "1", link: "https://en.wikipedia.org/wiki/Kanakangi", arohana: "S R1 G1 M1 P D1 N1 Ṡ", avarohana: "Ṡ N1 D1 P M1 G1 R1 S")))
}
