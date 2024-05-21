//
//  PieSegmentTruncated.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/28/23.
//

import SwiftUI

struct PieSegmentTruncated: Shape {
    
    var start: Angle
    var end: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let midPoint = CGPoint(x: rect.minX + rect.width/2, y: rect.width/2)
        path.move(to: midPoint)
        path.addArc(center: center, radius: rect.width/2, startAngle: start, endAngle: end, clockwise: false)
        
        path.addArc(center: center, radius: rect.width, startAngle: end, endAngle: start, clockwise: true)
        
        return path
    }
}
