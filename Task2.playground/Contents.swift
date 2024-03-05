import UIKit

func minWindow(_ s: String, _ t: String) -> String {
    let sChars = Array(s)
    let tChars = Array(t)
    
    var charFrequency = [Character: Int]()
    for char in tChars {
        charFrequency[char, default: 0] += 1
    }
    
    var start = 0, end = 0, matched = 0
    var minLen = Int.max, minStart = 0
    
    while end < sChars.count {
        let rightChar = sChars[end]
        if let count = charFrequency[rightChar] {
            charFrequency[rightChar] = count - 1
            if count - 1 >= 0 {
                matched += 1
            }
        }
        
        while matched == tChars.count {
            let windowLen = end - start + 1
            if windowLen < minLen {
                minLen = windowLen
                minStart = start
            }
            
            let leftChar = sChars[start]
            if let count = charFrequency[leftChar] {
                // This means the character was in t
                if count == 0 {
                    matched -= 1
                }
                charFrequency[leftChar] = count + 1
            }
            
            start += 1
        }
        
        end += 1
    }
    
    return minLen < Int.max ? String(sChars[minStart..<(minStart + minLen)]) : ""
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "aa"))

