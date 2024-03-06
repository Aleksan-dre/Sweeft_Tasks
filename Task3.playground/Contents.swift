func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let sChars = Array(s)
    // Initialize a dynamic programming array to keep track of valid substrings. dp[i] is true if s[0...i-1] can be segmented.
    var dp = Array(repeating: false, count: s.count + 1)
    dp[0] = true // An empty string is always a valid segmentation.
    
    
    for i in 1...sChars.count {
        for word in wordDict {
            let wordChars = Array(word)
            // Check if the current word can fit ending at position i and if the substring before it is valid.
            if i >= wordChars.count && dp[i - wordChars.count] {
                
                let start = s.index(s.startIndex, offsetBy: i - wordChars.count)
                let end = s.index(s.startIndex, offsetBy: i)
                
                let substring = s[start..<end]
                
                if substring == word {
                    dp[i] = true
                    break // Found a valid segmentation, no need to check further.
                }
            }
        }
    }
    
    return dp[s.count]
}

// Test cases
let s1 = "leetcode"
let wordDict1 = ["leet", "code"]
print(wordBreak(s1, wordDict1))

let s2 = "applepenapple"
let wordDict2 = ["apple", "pen"]
print(wordBreak(s2, wordDict2))
