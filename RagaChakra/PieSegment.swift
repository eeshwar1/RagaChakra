//
//  PieSegment.swift
//  RagaChakra
//
//  Created by Venkateswaran Venkatakrishnan on 9/23/23.
//

import SwiftUI

struct PieSegment: Shape {
    
    var start: Angle
    var end: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.width, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}

