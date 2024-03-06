func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var start = 0 // Tracks the start index of the current substring.
    var charIndexMap = [Character: Int]() // Maps characters to their last index.

    let characters = Array(s)

    for (i, char) in characters.enumerated() {
        // If character was seen before and is within the current substring,
        // move the start to the index after the last occurrence.
        if let index = charIndexMap[char], index >= start {
            start = index + 1
        }

        charIndexMap[char] = i
        maxLength = max(maxLength, i - start + 1)
    }
    
    return maxLength
}

// Test cases
print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
