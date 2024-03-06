func minWindow(_ s: String, _ t: String) -> String {
    
    let sChars = Array(s)
    let tChars = Array(t)
    
    var charFrequency = [Character: Int]()
    for char in tChars {
        charFrequency[char, default: 0] += 1
    }
    
    var start = 0, end = 0, matched = 0
    var minLen = Int.max, minStart = 0
    
    // Iterate over sChars using end as the right boundary of the window.
    while end < sChars.count {
        let rightChar = sChars[end]
        // If the right character is in t, decrease its frequency in the charFrequency map.
        if let count = charFrequency[rightChar] {
            charFrequency[rightChar] = count - 1
            // If the character's count is 0 or positive, it's a match.
            if count - 1 >= 0 {
                matched += 1
            }
        }
        
        // Try to shrink the window from the left if all characters from t are matched.
        while matched == tChars.count {
            let windowLen = end - start + 1
            // Update minimum window if the current window is smaller.
            if windowLen < minLen {
                minLen = windowLen
                minStart = start
            }
            
            // Try to shrink the window from the left.
            let leftChar = sChars[start]
            if let count = charFrequency[leftChar] {
                // If the left character's frequency is increased to 1 or more, it means this character is needed for a match.
                if count == 0 {
                    matched -= 1
                }
                charFrequency[leftChar] = count + 1
            }
            
            start += 1
        }
        
        end += 1
    }
    
    // Return the minimum window substring if found; otherwise, return an empty string.
    return minLen < Int.max ? String(sChars[minStart..<(minStart + minLen)]) : ""
}

// Test cases
print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "aa"))
