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

internal enum RGBAKeys: CodingKey {
    
    case r, g, b, a
}

public struct RGBA: Codable {
    
    private static func normalize<T: SignedNumeric & Comparable>(_ value: T) -> T {
        return value < 0 ? 0 : (value > 255 ? 255 : value)
    }
    
    public var r: Int
    public var g: Int
    public var b: Int
    
    public var a: CGFloat
    
    public init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.r = RGBA.normalize(r)
        self.g = RGBA.normalize(g)
        self.b = RGBA.normalize(b)
        self.a = RGBA.normalize(a)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RGBAKeys.self)
        self.r = try container.decode(Int.self, forKey: .r)
        self.g = try container.decode(Int.self, forKey: .g)
        self.b = try container.decode(Int.self, forKey: .b)
        self.a = try container.decode(CGFloat.self, forKey: .a)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RGBAKeys.self)
        try container.encode(r, forKey: .r)
        try container.encode(g, forKey: .g)
        try container.encode(b, forKey: .b)
        try container.encode(a, forKey: .a)
    }
}

extension RGBA: CustomStringConvertible {
    
    public var description: String {
        return "(r: \(r); g: \(g); b: \(b); a: \(a))"
    }
}

extension RGBA: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(r)
        hasher.combine(g)
        hasher.combine(b)
        hasher.combine(a)
    }
}

extension RGBA: Equatable {
    
    public static func == (lhs: RGBA, rhs: RGBA) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

public extension RGBA {
    
    var color: Color {
        return Color(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
}

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
