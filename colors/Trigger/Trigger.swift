//
//  Trigger.swift
//  Trigger
//
//  Created by Vladimir Psyukalov on 01.01.2020.
//  Copyright © 2020 Vladimir Psyukalov. All rights reserved.
//

import Foundation

public typealias TriggerBlock = (_ key: String) -> Void

public class Trigger {
    
    public static var counts = [String : Int]()
    
    public static var block: TriggerBlock?
    
    // MARK: - Public
    
    public static func isTriggered(for key: String) -> Bool {
        guard let count = counts[key] else {
            return false
        }
        let result = count <= self.count(for: key)
        if result {
            setCount(0, for: key)
            block?(key)
        } else {
            increase(for: key)
        }
        return result
    }
    
    // MARK: - Private
    
    private static func increase(for key: String) {
        setCount(count(for: key) + 1, for: key)
    }
    
    private static func count(for key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    private static func setCount(_ count: Int, for key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(count, forKey: key)
        userDefaults.synchronize()
    }
}
