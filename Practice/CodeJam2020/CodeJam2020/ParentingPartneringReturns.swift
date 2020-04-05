//
//  ParentingPartneringReturns.swift
//  CodeJam2020
//
//  Created by Sven Andabaka on 04.04.20.
//  Copyright © 2020 Sven Andabaka. All rights reserved.
//

import Foundation

class ParentingPartneringReturns {
    
    func solve(times: inout [(Int, Int, Int)], t: Int) {
        var sol : Array<Character> = Array(repeating: "C", count: times.count)
        
        times.sort {
            $0.0 < $1.0
        }
        
        var c: [(Int, Int)] = []
        var j: [(Int, Int)] = []
        
        for (start, end, index) in times {
            if hasTime(start: start, end: end, person: c) {
                c.append((start, end))
                sol[index] = "C"
            } else if hasTime(start: start, end: end, person: j) {
                j.append((start, end))
                sol[index] = "J"
            } else {
                print("Case #\(t): IMPOSSIBLE")
                return
            }
        }
        
        print("Case #\(t): \(String(sol))")
    }

    func hasTime(start: Int, end: Int, person: [(Int, Int)]) -> Bool {
        for (s, e) in person {
            if !(end <= s || start >= e) {
                return false
            }
        }
        return true
    }
    
    func run() {
        let t = Int(readLine()!)!
        for index in 1...t {
            let n = Int(readLine()!)!
            
            // (start, end, index)
            var times: [(Int, Int, Int)] = []
            
            for i in 0...(n-1) {
                let line: String = readLine()!
                let time = line.components(separatedBy: " ").map { Int($0)! }
                times.append((time[0], time[1], i))
            }
            
            solve(times: &times, t: index)
        }
    }
}
