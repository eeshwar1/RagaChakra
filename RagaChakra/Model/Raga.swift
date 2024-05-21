//
//  Raga.swift
//  RagaBox
//
//  Created by Venkateswaran Venkatakrishnan on 3/6/21.
//

import Foundation

struct Raga: Codable, Identifiable, Equatable {
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case mela_raga
        case mela_num
        case link
        case arohana
        case avarohana
    }

    let id = UUID()
    let name: String
    let mela_raga: String
    let mela_num: String
    let link: String
    let arohana: String
    let avarohana: String
    
    var allNotes: [String] {
        
        get {
            (arohana + " " + avarohana).components(separatedBy: " ")
        }
    
    }
    
    var isMela: Bool {
        
        return self.mela_raga == ""
    }
    static func ==(lhs: Raga, rhs: Raga) -> Bool {
       return lhs.name == rhs.name
    }
}

