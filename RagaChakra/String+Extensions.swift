//
//  String+Extensions.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 10/1/23.
//

import Foundation

extension String {

        func unaccent() -> String {

            return self.folding(options: .diacriticInsensitive, locale: .current)

        }

    
}
