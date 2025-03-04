//
//  lc127_Word_Ladder.swift
//  
//
//  Created by Arun Sharma on 05/03/25.
//

import Foundation

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    if !wordList.contains(endWord) {
        return 0
    }
    var wordList = wordList
    // not part of the wordList initially. So add it.
    wordList.append(beginWord)
    
    ///
    /// **Create the adjacency list**
    /// This is possible in O(n(m^2))
    /// Where 'n' is because of going over every word in the list
    /// 'm' is because we're going over every character we have to replace with the wildcard character
    /// Another 'm' because we have to add every word in the adjacencyMap
    var adjacencyMap = [String: [String]]()
    for word in wordList {
        var wordArray = Array(word)
        for j in 0..<word.count {
            // Replace every char in every word with a wildcard
            let pattern: String = wordArray[0..<j] + "*" + wordArray[j + 1..<wordArray.count]
            // Add words in the map what make up the same pattern. This will give us a graph to work with
            if let _ = adjacencyMap[pattern] {
                adjacencyMap[pattern]!.append(word)
            } else {
                adjacencyMap[pattern] = [word]
            }
        }
    }
    
    ///**Run standard BFS**
    /// Number of edges in the graph could be n^2
    /// To find each neighbor we have to do an m operation
    /// This leaves us with O(n^2 times m)
    var visit: Set<String> = [beginWord]
    var queue: [String] = [beginWord]
    var result = 1
    
    while !queue.isEmpty {
        for i in 0..<queue.count {
            // pop left
            let word = queue.removeFirst()
            if word == endWord {
                return result   // we've found our result
            }
            // after popping a word, find its neighbors. How?
            var wordArray = Array(word)
            // first we've to see all the patterns that this word falls into
            for j in 0..<word.count {
                let pattern: String = wordArray[0..<j] + "*" + wordArray[j + 1..<wordArray.count]
                // then we've to get all the words that fall into the exact same pattern
                if let wordsWithPattern = adjacencyMap[pattern] {
                    for adjacentWord in wordsWithPattern {
                        // make sure to not add words that have already been visited
                        if !visit.contains(adjacentWord) {
                            visit.insert(adjacentWord)
                            queue.append(adjacentWord)
                        }
                    }
                }
            }
        }
        result += 1
    }
    return 0
}
}
