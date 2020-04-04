//
//  NestingDepth.swift
//  CodeJam2020
//
//  Created by Sven Andabaka on 04.04.20.
//  Copyright © 2020 Sven Andabaka. All rights reserved.
//

import Foundation

class NestingDepth {
    
    func solve(s: String, t: Int) {
        var sol = ""
        let nums = Array(s).map { Int(String($0))! }
        var actDepth = 0
        
        for elem in nums {
            while actDepth < elem {
                sol += "("
                actDepth += 1
            }
            while actDepth > elem {
                sol += ")"
                actDepth -= 1
            }
            sol += String(elem)
        }
        
        while actDepth > 0 {
            sol += ")"
            actDepth -= 1
        }
        
        print("Case #\(t): \(sol)")

    }

    func run() {
        let t = Int(readLine()!)!
        for index in 1...t {
            let s = readLine()!
            solve(s: s, t: index)
        }
    }
}
