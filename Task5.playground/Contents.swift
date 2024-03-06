func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    
    // Extract start times and end times from the intervals, then sort them.
    let startTimes = intervals.map { $0[0] }.sorted()
    let endTimes = intervals.map { $0[1] }.sorted()

    var startPointer = 0
    var endPointer = 0
    // `rooms' tracks the current number of rooms in use, `maxRooms` tracks the maximum number needed at any point.
    var rooms = 0
    var maxRooms = 0

    while startPointer < startTimes.count {
        // If the next meeting starts before the earliest current meeting ends, we need an additional room.
        if startTimes[startPointer] < endTimes[endPointer] {
            rooms += 1
            startPointer += 1
            maxRooms = max(maxRooms, rooms) // Update maxRooms if the current room count exceeds the previous maximum.
        } else {
            // If the current meeting ends before the next one starts, we can reuse a room.
            rooms -= 1
            endPointer += 1 // Move to the next meeting end time.
        }
    }
    
    return maxRooms
}

// Test cases
let intervals1 = [[0, 30],[5, 10],[15, 20]]
print(minMeetingRooms(intervals1))

let intervals2 = [[7,10],[2,4]]
print(minMeetingRooms(intervals2))
