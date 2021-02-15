//
//  Color.swift
//  Color
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

#if os(iOS)

import UIKit

public typealias Color = UIColor

#endif

#if os(macOS)

import Cocoa

public typealias Color = NSColor

#endif










public extension RGBA {
    
    static func + (lhs: RGBA, rhs: RGBA) -> RGBA {
        let x = (1.0 - rhs.a) * lhs.a
        let a = x + rhs.a
        let r = Int((x * CGFloat(lhs.r) + rhs.a * CGFloat(rhs.r)) / a)
        let g = Int((x * CGFloat(lhs.g) + rhs.a * CGFloat(rhs.g)) / a)
        let b = Int((x * CGFloat(lhs.b) + rhs.a * CGFloat(rhs.b)) / a)
        return RGBA(r: r, g: g, b: b, a: a)
    }
    
    static func += (lhs: inout RGBA, rhs: RGBA) {
        lhs = lhs + rhs
    }
}


