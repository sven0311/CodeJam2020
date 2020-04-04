//
//  Vestigium.swift
//  CodeJam2020
//
//  Created by Sven Andabaka on 04.04.20.
//  Copyright © 2020 Sven Andabaka. All rights reserved.
//


class Vestigium {
    
    func run() {
        let t = Int(readLine()!)!
        for index in 1...t {
            let n = Int(readLine()!)!
            
            var rowSet = Array(repeating: Set<Int>(), count: n)
            var columnSet = Array(repeating: Set<Int>(), count: n)
            var trace = 0
            
            for i in 0...(n-1) {
                let line: String = readLine()!
                let lineArr = line.components(separatedBy: " ")
                
                for (j, elem) in lineArr.enumerated() {
                    let num = Int(elem)!
                    rowSet[i].insert(num)
                    columnSet[j].insert(num)
                    if j == i {
                        trace += num
                    }
                }
                
            }
            
            let duplicateRowCounter = rowSet.filter{ $0.count != n }.count
            let duplicateColumnCounter = columnSet.filter{ $0.count != n }.count
            
            print("Case #\(index): \(trace) \(duplicateRowCounter) \(duplicateColumnCounter) ")

        }
    }
}




