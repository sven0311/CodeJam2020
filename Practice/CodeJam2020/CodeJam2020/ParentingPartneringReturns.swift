//
//  ParentingPartneringReturns.swift
//  CodeJam2020
//
//  Created by Sven Andabaka on 04.04.20.
//  Copyright © 2020 Sven Andabaka. All rights reserved.
//

import Foundation

class ParentingPartneringReturns {
    
    func solve(times: [(Int, Int, Int)], t: Int) {
        var sol: Array<Character> = Array(repeating: "C", count: times.count)
        
        var c: [(Int, Int, Int)] = []
        var j: [(Int, Int, Int)] = []
        
        for (start, end, index) in times {
            if !assignActivity(start: start, end: end, index: index, c: &c, j: &j, sol: &sol) {
                print("Case #\(t): IMPOSSIBLE")
                return
            }
        }
                
        print("Case #\(t): \(String(sol))")
    }
    
    func assignActivity(start: Int, end: Int, index: Int, c: inout [(Int, Int, Int)], j: inout [(Int, Int, Int)], sol:  inout [Character]) -> Bool {
        let indexBlockingC = hasNoTimeBecauseOfActivityWithIndex(start: start, end: end, person: c)
        if indexBlockingC < 0 {
            c.append((start, end, index))
            sol[index] = "C"
            return true
        }
        let indexBlockingJ = hasNoTimeBecauseOfActivityWithIndex(start: start, end: end, person: j)
        if indexBlockingJ < 0 {
            j.append((start, end, index))
            sol[index] = "J"
            return true
        }
        
        if changeActivityToOtherPerson(index: indexBlockingJ, from: &j, to: &c, sol: &sol, toPerson: "C") {
            return assignActivity(start: start, end: end, index: index, c: &c, j: &j, sol: &sol)
        }
        
        if changeActivityToOtherPerson(index: indexBlockingC, from: &c, to: &j, sol: &sol, toPerson: "J") {
            return assignActivity(start: start, end: end, index: index, c: &c, j: &j, sol: &sol)
        }
        
        return false
    }
    
    func changeActivityToOtherPerson(index: Int, from: inout [(Int, Int, Int)], to: inout [(Int, Int, Int)], sol: inout [Character], toPerson: Character) -> Bool {
        let ind = from.firstIndex { $0.2 == index }
        let activity = from.remove(at: ind!)
        
        if (hasNoTimeBecauseOfActivityWithIndex(start: activity.0, end: activity.1, person: to) < -1) {
            to.append(activity)
            sol[index] = toPerson
            return true
        }
        
        from.append(activity)
        return false
    }
    
    // -1 means has Time
    func hasNoTimeBecauseOfActivityWithIndex(start: Int, end: Int, person: [(Int, Int, Int)]) -> Int {
        for (s, e, index) in person {
            if !(end <= s || start >= e) {
                return index
            }
        }
        return -1
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
            
            solve(times: times, t: index)
        }
    }
}
