//
//  RGBA.swift
//  RGBA
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

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
