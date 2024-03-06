func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var frequencyMap = [Int: Int]()

    for num in nums {
        frequencyMap[num, default: 0] += 1
    }
    
    // Create a "buckets" array where each index represents the frequency,
    // and each element at that index is a list of numbers with that frequency.
    var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
    
    for (num, count) in frequencyMap {
        buckets[count].append(num)
    }
    
    var result: [Int] = []
    // Iterate through the buckets in reverse order to start with the highest frequency.
    
    for bucket in buckets.reversed() where result.count < k {
        result.append(contentsOf: bucket)
        // If we've reached k elements, stop the iteration.
        if result.count >= k {
            break
        }
    }
    
    return result
}

// Test cases
let nums1 = [1,1,1,2,2,3]
let k1 = 2
print(topKFrequent(nums1, k1))

let nums2 = [1]
let k2 = 1
print(topKFrequent(nums2, k2))
