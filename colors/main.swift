//
//  main.swift
//  colors
//
//  Created by Vladimir Psyukalov on 13.02.2021.
//  Copyright © 2021 Vladimir Psyukalov. All rights reserved.
//

import Foundation

/*
 print("Hello, World!")
 
 let a = RGBA(r: 0, g: 0, b: 0, a: 0)
 let b = RGBA(r: 0, g: 0, b: 0, a: 0)
 let c = RGBA(r: 255, g: 0, b: 0, a: 0)
 
 let x1 = a == b
 let x2 = a == c
 
 print(x1)
 print(x2)
 
 print(a.hashValue)
 print(b.hashValue)
 print(c.hashValue)
 
 print("----------------")
 
 let c0 = RGBA(r: 64, g: 128, b: 255, a: 0.55)
 let c1 = RGBA(r: 255, g: 32, b: 128, a: 0.4)
 
 let c2 = c0 + c1
 
 print(c2)
 */

let array = [
    RGBA(r: 0, g: 0, b: 0, a: 1.0),
    RGBA(r: 255, g: 255, b: 255, a: 1.0),
    RGBA(r: 128, g: 128, b: 128, a: 0.6),
    RGBA(r: 255, g: 0, b: 0, a: 0.4)
]

let matrix = Matrix<RGBA>(m: 2, n: 2, array: array)

let data = try? JSONEncoder().encode(matrix)
let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
let dataJson = try? JSONSerialization.data(withJSONObject: json!, options: .fragmentsAllowed)
let string = String(data: dataJson!, encoding: .utf8)
let matrix2 = try? JSONDecoder().decode(Matrix<RGBA>.self, from: data!)

print(matrix)
print(data!)
print(json!)
print(dataJson!)
print(string!)
print(matrix2!)
