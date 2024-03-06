func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let sChars = Array(s)
    var dp = Array(repeating: false, count: s.count + 1)
    dp[0] = true
    
    for i in 1...sChars.count {
        for word in wordDict {
            let wordChars = Array(word)
            if i >= wordChars.count && dp[i - wordChars.count] {
                let start = s.index(s.startIndex, offsetBy: i - wordChars.count)
                let end = s.index(s.startIndex, offsetBy: i)
                let substring = s[start..<end]
                
                if substring == word {
                    dp[i] = true
                    break
                }
            }
        }
    }
    
    return dp[s.count]
}

let s1 = "leetcode"
let wordDict1 = ["leet", "code"]
print(wordBreak(s1, wordDict1))

let s2 = "applepenapple"
let wordDict2 = ["apple", "pen"]
print(wordBreak(s2, wordDict2))


