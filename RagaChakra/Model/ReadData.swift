//
//  ReadData.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/24/23.
//

import Foundation

class ReadData: ObservableObject  {
    
    @Published var ragas = [Raga]()

    init(){
        loadData()
    }
    
    func loadData()  {
        
        guard let url = Bundle.main.url(forResource: "ragas", withExtension: "json")
            else {
                print("json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        
        if let data = data {
            
            do {
            
                let ragas = try JSONDecoder().decode([Raga].self, from: data)
                self.ragas = ragas
                
            } catch let DecodingError.dataCorrupted(context) {
               print(context)
           } catch let DecodingError.keyNotFound(key, context) {
               print("Key '\(key)' not found:", context.debugDescription)
               print("codingPath:", context.codingPath)
           } catch let DecodingError.valueNotFound(value, context) {
               print("Value '\(value)' not found:", context.debugDescription)
               print("codingPath:", context.codingPath)
           } catch let DecodingError.typeMismatch(type, context)  {
               print("Type '\(type)' mismatch:", context.debugDescription)
               print("codingPath:", context.codingPath)
           } catch {
               print("error: ", error)
           }
        }
      
        

    }
     
}
