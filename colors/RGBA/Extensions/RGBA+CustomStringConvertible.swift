//
//  RGBA+CustomStringConvertible.swift
//  RGBA+CustomStringConvertible
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

extension RGBA: CustomStringConvertible {
    
    public var description: String {
        return "(r: \(r); g: \(g); b: \(b); a: \(a))"
    }
}
