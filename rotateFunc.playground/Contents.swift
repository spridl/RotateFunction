import UIKit

var nums = [1,2,3,4,5,6,7,8,9]
var k = 2

//MARK: Первый метод

func rotate(_ nums: [Int], _ k: Int) {
    
    if nums.count <= 1 || nums.count > 105 {
        return print("inavalid array")
    }
    var check = true
    nums.map { (i) in
        if i <= -231 || i >= 230 {
           check = false
        }
    }
    if check == false { return print("invalid num") }
    
    if k <= 1 || k >= 105 {
        return print("invalid StepCount")
    }
    
    let stepCount = nums.count - k
    let slice1 = nums[..<stepCount]
    let slice2 = nums[stepCount...]
    let newNums = Array(slice2) + Array(slice1)
    print(newNums)
}
rotate(nums, k)



//MARK: Второй метод

func gcd(_ numsCount: Int, _ startPosition: Int) -> Int {
    if startPosition == 0 {
        return numsCount
    }
    return gcd(startPosition, numsCount % startPosition)
}

func rotateTwo(_ nums: inout [Int], _ k: Int) {
    
    if nums.count <= 1 || nums.count > 105 {
        return print("inavalid array")
    }
    var check = true
    nums.map { (i) in
        if i <= -231 || i >= 230 {
           check = false
        }
    }
    if check == false { return print("invalid num") }
    
    if k <= 1 || k >= 105 {
        return print("invalid StepCount")
    }
    
    let stepCount = k
    let startPosition = nums.count - stepCount
    let nSet = gcd(nums.count, startPosition)
    
    for b in 0..<nSet {
        let c = nums[b]
        var d = b
        
        while true {
            var e = d + startPosition
            if e >= nums.count {
                e = e - nums.count
            }
            if e == b {
                break
            }
            nums[d] = nums[e]
            d = e
        }
        nums[d] = c
    }
    print(nums)
}
//rotateTwo(&nums, k)

//MARK: Третий метод
 
extension RangeReplaceableCollection {
    func rotatingRight(positions: Int) -> SubSequence {
        let index = self.index(endIndex, offsetBy: -positions, limitedBy: startIndex) ?? startIndex
        return self[index...] + self[..<index]
    }
    mutating func rotateRight(positions: Int) {
        let index = self.index(endIndex, offsetBy: -positions, limitedBy: startIndex) ?? startIndex
        let slice = self[index...]
        removeSubrange(index...)
        insert(contentsOf: slice, at: startIndex)
    }
}

//nums.rotateRight(positions: 4)
//print(nums)
