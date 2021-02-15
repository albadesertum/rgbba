//
//  Color+RGBA.swift
//  colors
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

#if os(iOS)

import UIKit

public typealias Color = UIColor

#endif

#if os(macOS)

import Cocoa

public typealias Color = NSColor

#endif

extension Color {
    
    var rgba: RGBA {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBA(r: Int(r * 255.0), g: Int(g * 255.0), b: Int(b * 255.0), a: a)
    }
}
