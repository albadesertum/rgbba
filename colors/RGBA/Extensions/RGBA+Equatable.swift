//
//  RGBA+Equatable.swift
//  RGBA+Equatable
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

extension RGBA: Equatable {
    
    public static func == (lhs: RGBA, rhs: RGBA) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
