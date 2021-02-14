//
//  Node.swift
//  Node
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

public class Node {
    
    public let index: Index
    
    public let parent: Node?
    
    public let g: Float
    public let h: Float
    
    public var f: Float {
        return g + h
    }
        
    public init(index: Index, parent: Node? = nil, g: Float, h: Float) {
        self.index = index
        self.parent = parent
        self.g = g
        self.h = h
    }
}
