import Cocoa

class Solution {
    
    func minWindow(_ s: String, _ t: String) -> String {
        if t == "" {
            return ""
        }
        
        var sArray = Array(s)
        var tArray = Array(t)
        
        var countT: [Character: Int] = [:]
        
        for c in t {
            countT[c, default: 0] += 1
        }
        
        var window: [Character: Int] = [:]
        var have = 0
        var need = countT.count
        var res = [0, 0]
        var resLen = Int.max
        var l = 0
        
        for r in 0..<sArray.count {
            var c = sArray[r]
            window[c, default: 0] += 1
            
            if countT[c] != nil && window[c] == countT[c] {
                have += 1
            }
            
            while have == need {
                // update our result
                if r - l + 1 < resLen {
                    resLen = r - l + 1
                    res = [l, r]
                }
                
                // pop from the left of our window
                window[sArray[l], default: 0] -= 1
                if countT[sArray[l]] != nil && window[sArray[l]]! < countT[sArray[l]]! {
                    have -= 1
                }
                
                l += 1
            }
        }
        
        if resLen != Int.max {
            return String(sArray[res[0]...res[1]])
        } else {
            return ""
        }
        
    }
}
