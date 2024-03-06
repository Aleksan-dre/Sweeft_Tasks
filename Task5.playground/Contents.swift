func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let startTimes = intervals.map { $0[0] }.sorted()
    let endTimes = intervals.map { $0[1] }.sorted()

    var startPointer = 0
    var endPointer = 0
    var rooms = 0
    var maxRooms = 0

    while startPointer < startTimes.count {
        if startTimes[startPointer] < endTimes[endPointer] {
            rooms += 1
            startPointer += 1
            maxRooms = max(maxRooms, rooms)
        } else {
            rooms -= 1
            endPointer += 1
        }
    }
    
    return maxRooms
}

let intervals1 = [[0, 30],[5, 10],[15, 20]]
print(minMeetingRooms(intervals1))

let intervals2 = [[7,10],[2,4]]
print(minMeetingRooms(intervals2))

