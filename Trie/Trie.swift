//
//  Trie.swift
//  
//
//  Created by Arun Sharma on 28/02/25.
//

import Foundation

class TrieNode {
    var value: Character?
    var children: [Character: TrieNode] = [:]
    var isTerminating: Bool = false
    weak var parent: TrieNode?
    
    init(value: Character?, parent: TrieNode?) {
        self.value = value
        self.parent = parent
    }
}

class Trie { // aka Prefix tree
    // Think of this as an anchor point for the entire trie
    private let root = TrieNode(value: nil, parent: nil)
    
    func insert(_ word: String) {
        var currentNode = root
        
        for char in word {
            if currentNode.children[char] == nil {
                currentNode.children[char] = TrieNode(value: char, parent: currentNode)
            }
            currentNode = currentNode.children[char]!
        }
        currentNode.isTerminating = true
    }
    
    func contains(_ word: String) -> Bool {
        var currentNode = root
        
        for char in word {
            guard let next = currentNode.children[char] else {
                return false
            }
            currentNode = next
        }
        return currentNode.isTerminating
    }
    
    func remove(_ word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        // traverse to find the node with the last character of the word
        for char in word {
            // check if word exists in trie
            guard let next = currentNode.children[char] else { return }
            currentNode = next
        }
        
        // check if current node isTerminating
        // if yes, word exists
        
        if currentNode.isTerminating {
            currentNode.isTerminating = false
        } else {
            // if not terminating, then word doesn't exist in trie
            return
        }
        
        // clean up unnecessary nodes
        
        // if current node has no children and isn't marking an end of another word, we can safely remove it
        while let parent = currentNode.parent, currentNode.children.isEmpty, !currentNode.isTerminating {
            // safely removing from parent's children dictionary
            parent.children[currentNode.value!] = nil
            // we keep going up until we find a node that is either necessary, has children, is the end of another word  or is the root node
            
            currentNode = parent
        }
    }
    
    func startsWith(_ prefix: String) -> [String] {
        var currentNode = root
        
        for char in prefix {
            // find the node corresponding to the last character in the prefix
            if let next = currentNode.children[char] {
                currentNode = next
            } else {
                // prefix doesn't exist
                return []
            }
        }
        
        var results = [String]()
        collectWords(node: currentNode, prefix: prefix, results: &results)  // results passed by reference to this helper function
        return results
    }
    
    private func collectWords(node: TrieNode, prefix: String, results: inout [String]) {
        if node.isTerminating {
            results.append(prefix)
        }
        
        for (char, child) in node.children {
            let prefixWithChar = prefix + String(char)
            collectWords(node: child, prefix: prefixWithChar, results: &results)
        }
    }
}

let trie = Trie()
trie.insert("apple")
trie.insert("orange")
trie.insert("banana")
trie.insert("pineapple")
trie.insert("app")
trie.insert("almond")
trie.insert("apricot")
trie.insert("grape")

print(trie.contains("orange"))

trie.remove("orange")

print(trie.contains("orange"))

print(trie.startsWith("a"))
