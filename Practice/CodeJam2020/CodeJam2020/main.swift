//
//  main.swift
//  CodeJam2020
//
//  Created by Sven Andabaka on 03.04.20.
//  Copyright © 2020 Sven Andabaka. All rights reserved.
//

import Foundation

func solve(p: String) -> String {
    var sol = ""
    for char in p {
        if char == "S" {
            sol += "E"
        } else {
            sol += "S"
        }
    }
    return sol
}

let t = Int(readLine()!)
for index in 1...t! {
    Int(readLine()!)
    let p = readLine()
    
    print("Case #\(index): \(solve(p: p!))")
}


