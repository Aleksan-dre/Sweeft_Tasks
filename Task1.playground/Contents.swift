import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var start = 0
    var charIndexMap = [Character: Int]()
    
    let characters = Array(s)
    
    for (i, char) in characters.enumerated() {
        if let index = charIndexMap[char], index >= start {
            start = index + 1
            
        }
        charIndexMap[char] = i
        maxLength = max(maxLength, i - start + 1)
    }
    
    return maxLength
    

}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))

