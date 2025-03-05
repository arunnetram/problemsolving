//
//  322_Coin_Change.swift
//  
//
//  Created by Arun Sharma on 06/03/25.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = [Int](repeating: amount+1, count: amount+1)
    
    dp[0] = 0
    
    for amount in 1..<amount+1 {
        for coin in coins {
            // If the coin we're looking at minus the amount is non negative, we can continue looking
            if amount - coin >= 0 {
                /// Where in **1 + dp[amount - coin]**
                /// 1 denotes the number of coins of that value being used to make up the desired amount
                /// (amount - coin) is the remainder amount and dp of that will give us the number of coins needed to come up with that amount
                dp[amount] = min(dp[amount], 1 + dp[amount - coin])
            }
        }
    }
    
    return dp[amount] != amount+1 ? dp[amount] : -1
    
}
