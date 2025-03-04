//
//  lc994_Rotting_Oranges.swift
//  
//
//  Created by Arun Sharma on 04/03/25.
//

import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    var queue = [(Int, Int)]()
    var time = 0
    var fresh = 0
    var grid = grid
    
    // making notes of all fresh and rotting oranges in the grid
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            let orangeStatus = grid[i][j]
            if orangeStatus == 1 {
                fresh += 1
            }
            if orangeStatus == 2 {
                queue.append((i, j))    // rotting added to queue
            }
        }
    }
    
    var directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    while !queue.isEmpty && fresh > 0 {
        // assessing every rotting orange in crate per minute
        for _ in 0..<queue.count {
            
            let (r, c) = queue.removeFirst()
            
            // find adjacent fresh oranges and mark them rotting
            for direction in directions {
                let (row, column) = ((direction[0] + r), (direction[1] + c))
                // if in bounds and fresh, make rotten
                if (row < 0 || row == grid.count || column < 0 || column == grid[0].count || grid[row][column] != 1) { continue }
                grid[row][column] = 2
                queue.append((row, column))     // new rotting oranges added to queue
                fresh -= 1
            }
        }
        time += 1
    }

    return fresh == 0 ? time : -1
}
